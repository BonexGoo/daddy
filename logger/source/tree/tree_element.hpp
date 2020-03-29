#pragma once
#include <boss.hpp>
#include <service/boss_zay.hpp>

class TreeElement
{
protected:
    enum class Type {Value, Group};

public:
    TreeElement(TreeElement* parent, Type type);
    virtual ~TreeElement();

public:
    virtual sint32 OnRender(ZayPanel& panel, bool& needupdate, chars name) const = 0;
    void Update();
    float GetUpdateAni() const;
    bool CheckUpdate() const;

private:
    static const sint32 UpdateAniMax = 1000;

public:
    inline const Type& type() const {return mType;}
    inline const String& uiname() const {return mUIName;}
    inline const sint32& updatecount() const {return mUpdateCount;}

private:
    TreeElement* mRefParent;
    Type mType;
    String mUIName;
    sint32 mUpdateCount;
    mutable sint32 mUpdateAni;
};
