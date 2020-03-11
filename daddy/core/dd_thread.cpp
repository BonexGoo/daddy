/// @brief     Definition of thread utility.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_thread.hpp"

// Dependencies
#if DD_OS_WINDOWS
    #include <windows.h>
    #define MUTEX_DATA                      struct {HANDLE e; long c;}
    #define MUTEX_INIT(ID)                  do {(ID)->e = CreateEvent(0, 0, 0, 0); (ID)->c = 0;} while(false)
    #define MUTEX_DESTROY(ID)               do {if((ID)->e) {CloseHandle((ID)->e); (ID)->e = 0;}} while(false)
    #define MUTEX_LOCK(ID)                  do {if(1 < InterlockedIncrement(&(ID)->c)) WaitForSingleObject((ID)->e, INFINITE);} while(false)
    #define MUTEX_UNLOCK(ID)                do {if(0 < InterlockedDecrement(&(ID)->c)) SetEvent((ID)->e);} while(false)
    #define SEMAPHORE_DATA                  HANDLE
    #define SEMAPHORE_CLEAR(ID)             do {*(ID) = nullptr;} while(false)
    #define SEMAPHORE_BIND(ID, NAME)        do \
        { \
            SECURITY_ATTRIBUTES SA; \
            SA.nLength = sizeof(SECURITY_ATTRIBUTES); \
            SA.lpSecurityDescriptor = nullptr; \
            SA.bInheritHandle = true; \
            *(ID) = CreateSemaphoreA(&SA, 1, 1, NAME); \
            if(*(ID) == nullptr) \
                *(ID) = OpenSemaphoreA(SYNCHRONIZE | SEMAPHORE_MODIFY_STATE, true, NAME); \
            else if(GetLastError() == ERROR_ALREADY_EXISTS) \
            { \
                CloseHandle(*(ID)); \
                *(ID) = OpenSemaphoreA(SYNCHRONIZE | SEMAPHORE_MODIFY_STATE, true, NAME); \
            } \
        } while(false)
    #define SEMAPHORE_CREATE(ID, NAME, RET) do \
        { \
            SECURITY_ATTRIBUTES SA; \
            SA.nLength = sizeof(SECURITY_ATTRIBUTES); \
            SA.lpSecurityDescriptor = nullptr; \
            SA.bInheritHandle = true; \
            *(ID) = CreateSemaphoreA(&SA, 1, 1, NAME); \
            if(*(ID) == nullptr) \
                RET = false; \
            else if(GetLastError() == ERROR_ALREADY_EXISTS) \
            { \
                CloseHandle(*(ID)); \
                RET = false; \
            } \
            else RET = true; \
        } while(false)
    #define SEMAPHORE_DESTROY(ID, NAME)     do {CloseHandle(*(ID));} while(false)
    #define SEMAPHORE_LOCK(ID)              do {WaitForSingleObject(*(ID), INFINITE);} while(false)
    #define SEMAPHORE_UNLOCK(ID)            do {ReleaseSemaphore(*(ID), 1, nullptr);} while(false)
#else
    #include <pthread.h>
    #include <semaphore.h>
    #include <fcntl.h>
    #define MUTEX_DATA                      pthread_mutex_t
    #define MUTEX_INIT(ID)                  pthread_mutex_init((ID), nullptr)
    #define MUTEX_DESTROY(ID)               pthread_mutex_destroy((ID))
    #define MUTEX_LOCK(ID)                  pthread_mutex_lock((ID))
    #define MUTEX_UNLOCK(ID)                pthread_mutex_unlock((ID))
    #define SEMAPHORE_DATA                  sem_t*
    #define SEMAPHORE_CLEAR(ID)             do {*(ID) = nullptr;} while(false)
    #define SEMAPHORE_BIND(ID, NAME)        do \
        { \
            *(ID) = sem_open(NAME, O_CREAT | O_EXCL); \
            if(*(ID) == SEM_FAILED) \
                *(ID) = sem_open(NAME, O_EXCL); \
        } while(false)
    #define SEMAPHORE_CREATE(ID, NAME, RET) do \
        { \
            *(ID) = sem_open(NAME, O_CREAT | O_EXCL); \
            RET = (*(ID) != SEM_FAILED); \
        } while(false)
    #define SEMAPHORE_DESTROY(ID, NAME)     do {sem_close(*(ID)); sem_unlink(((Literal) NAME).buildNative());} while(false)
    #define SEMAPHORE_LOCK(ID)              do {sem_wait(*(ID));} while(false)
    #define SEMAPHORE_UNLOCK(ID)            do {sem_post(*(ID));} while(false)
#endif
typedef MUTEX_DATA MutexData;
typedef SEMAPHORE_DATA SemaphoreData;

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dMutex
void dMutex::lock()
{
    MUTEX_LOCK((MutexData*) mData);
}

void dMutex::unlock()
{
    MUTEX_UNLOCK((MutexData*) mData);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dMutex::escaper
void dMutex::_init_(InitType type)
{
    if(type == InitType::Create)
    {
        MutexData* NewData = new MutexData();
        MUTEX_INIT(NewData);
        mData = NewData;
    }
    else mData = nullptr;
}

void dMutex::_quit_()
{
    if(mData)
        MUTEX_DESTROY((MutexData*) mData);
}

void dMutex::_move_(_self_&& rhs)
{
    mData = rhs.mData;
}

void dMutex::_copy_(const _self_& rhs)
{
    DD_assert(false, "you have called an unused method.");
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dSemaphore
void dSemaphore::bind(utf8s name)
{
    SEMAPHORE_BIND((SemaphoreData*) mData, name);
    mName = name;
}

bool dSemaphore::createOnly(utf8s name)
{
    bool Success = false;
    SEMAPHORE_CREATE((SemaphoreData*) mData, name, Success);
    if(Success)
    {
        mName = name;
        return true;
    }
    return false;
}

void dSemaphore::lock()
{
    SEMAPHORE_LOCK((SemaphoreData*) mData);
}

void dSemaphore::unlock()
{
    SEMAPHORE_UNLOCK((SemaphoreData*) mData);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dSemaphore::escaper
void dSemaphore::_init_(InitType type)
{
    if(type == InitType::Create)
    {
        SemaphoreData* NewData = new SemaphoreData();
        SEMAPHORE_CLEAR(NewData);
        mData = NewData;
    }
    else mData = nullptr;
}

void dSemaphore::_quit_()
{
    if(*((SemaphoreData*) mData))
        SEMAPHORE_DESTROY((SemaphoreData*) mData, mName);
}

void dSemaphore::_move_(_self_&& rhs)
{
    mData = rhs.mData;
    mName = DD_rvalue(rhs.mName);
}

void dSemaphore::_copy_(const _self_& rhs)
{
    DD_assert(false, "you have called an unused method.");
}

} // namespace Daddy
