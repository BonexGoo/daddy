#pragma once
#include <boss.hpp>
#include "tree_element.hpp"

class TreeValue;

class TreeGroup : public TreeElement
{
public:
    TreeGroup(TreeElement* parent);
    ~TreeGroup() override;

public:
    sint32 OnRender(ZayPanel& panel, bool& needupdate, chars name = nullptr) const override;
    TreeValue* operator()(chars name, bool forced);
    bool Remove(chars name);
    bool RemoveAll();
    bool IsEmpty() const;

private:
    bool mIndexable;
    mutable bool mExpanded;
    Map<TreeElement*> mChildren;
};
