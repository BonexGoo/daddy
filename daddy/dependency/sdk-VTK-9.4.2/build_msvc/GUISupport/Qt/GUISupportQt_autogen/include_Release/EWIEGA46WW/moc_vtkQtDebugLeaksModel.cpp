/****************************************************************************
** Meta object code from reading C++ file 'vtkQtDebugLeaksModel.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../GUISupport/Qt/vtkQtDebugLeaksModel.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'vtkQtDebugLeaksModel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN20vtkQtDebugLeaksModelE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN20vtkQtDebugLeaksModelE = QtMocHelpers::stringData(
    "vtkQtDebugLeaksModel",
    "addObject",
    "",
    "vtkObjectBase*",
    "object",
    "removeObject",
    "registerObject",
    "processPendingObjects",
    "onAboutToQuit",
    "flags",
    "Qt::ItemFlags",
    "QModelIndex",
    "index"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN20vtkQtDebugLeaksModelE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   50,    2, 0x09,    1 /* Protected */,
       5,    1,   53,    2, 0x09,    3 /* Protected */,
       6,    1,   56,    2, 0x09,    5 /* Protected */,
       7,    0,   59,    2, 0x09,    7 /* Protected */,
       8,    0,   60,    2, 0x09,    8 /* Protected */,
       9,    1,   61,    2, 0x109,    9 /* Protected | MethodIsConst  */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void,
    QMetaType::Void,
    0x80000000 | 10, 0x80000000 | 11,   12,

       0        // eod
};

Q_CONSTINIT const QMetaObject vtkQtDebugLeaksModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QStandardItemModel::staticMetaObject>(),
    qt_meta_stringdata_ZN20vtkQtDebugLeaksModelE.offsetsAndSizes,
    qt_meta_data_ZN20vtkQtDebugLeaksModelE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN20vtkQtDebugLeaksModelE_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<vtkQtDebugLeaksModel, std::true_type>,
        // method 'addObject'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<vtkObjectBase *, std::false_type>,
        // method 'removeObject'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<vtkObjectBase *, std::false_type>,
        // method 'registerObject'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<vtkObjectBase *, std::false_type>,
        // method 'processPendingObjects'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onAboutToQuit'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'flags'
        QtPrivate::TypeAndForceComplete<Qt::ItemFlags, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QModelIndex &, std::false_type>
    >,
    nullptr
} };

void vtkQtDebugLeaksModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<vtkQtDebugLeaksModel *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->addObject((*reinterpret_cast< std::add_pointer_t<vtkObjectBase*>>(_a[1]))); break;
        case 1: _t->removeObject((*reinterpret_cast< std::add_pointer_t<vtkObjectBase*>>(_a[1]))); break;
        case 2: _t->registerObject((*reinterpret_cast< std::add_pointer_t<vtkObjectBase*>>(_a[1]))); break;
        case 3: _t->processPendingObjects(); break;
        case 4: _t->onAboutToQuit(); break;
        case 5: { Qt::ItemFlags _r = _t->flags((*reinterpret_cast< std::add_pointer_t<QModelIndex>>(_a[1])));
            if (_a[0]) *reinterpret_cast< Qt::ItemFlags*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

const QMetaObject *vtkQtDebugLeaksModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *vtkQtDebugLeaksModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN20vtkQtDebugLeaksModelE.stringdata0))
        return static_cast<void*>(this);
    return QStandardItemModel::qt_metacast(_clname);
}

int vtkQtDebugLeaksModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QStandardItemModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }
    return _id;
}
namespace {
struct qt_meta_tag_ZN19ReferenceCountModelE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN19ReferenceCountModelE = QtMocHelpers::stringData(
    "ReferenceCountModel",
    "updateReferenceCounts",
    ""
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN19ReferenceCountModelE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   20,    2, 0x09,    1 /* Protected */,

 // slots: parameters
    QMetaType::Void,

       0        // eod
};

Q_CONSTINIT const QMetaObject ReferenceCountModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QStandardItemModel::staticMetaObject>(),
    qt_meta_stringdata_ZN19ReferenceCountModelE.offsetsAndSizes,
    qt_meta_data_ZN19ReferenceCountModelE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN19ReferenceCountModelE_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<ReferenceCountModel, std::true_type>,
        // method 'updateReferenceCounts'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void ReferenceCountModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<ReferenceCountModel *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->updateReferenceCounts(); break;
        default: ;
        }
    }
    (void)_a;
}

const QMetaObject *ReferenceCountModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ReferenceCountModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN19ReferenceCountModelE.stringdata0))
        return static_cast<void*>(this);
    return QStandardItemModel::qt_metacast(_clname);
}

int ReferenceCountModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QStandardItemModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 1;
    }
    return _id;
}
QT_WARNING_POP
