#pragma once
#include <boss.hpp>
#include "tree_element.hpp"

class TreeValue : public TreeElement
{
public:
    TreeValue(TreeElement* parent);
    ~TreeValue() override;

public:
    sint32 OnRender(ZayPanel& panel, bool& needupdate, chars name) const override;
    void Set(chars value);
    void Add(chars value);

public:
    String mValue;
};
