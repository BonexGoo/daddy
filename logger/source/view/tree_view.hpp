#pragma once
#include <service/boss_zay.hpp>
#include <tree/tree_group.hpp>

class TreeView
{
public:
    TreeView();
    ~TreeView();

public:
    bool OnRender(ZayPanel& panel);

public:
    void Update(chars name, chars value, bool addition);
    void Remove(chars name);

private:
    id_mutex mMutex;
    TreeGroup mTree;
    sint32 mContentSize;
};
