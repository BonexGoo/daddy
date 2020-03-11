#pragma once
#include <service/boss_zay.hpp>
#include <node.hpp>
#include <scheduler.hpp>
#include <webserver.hpp>

class telegraphData : public ZayObject
{
public:
    telegraphData();
    ~telegraphData();

public:
    id_server mServer;
    Image mWorldMap;
    Nodes mNodes;

public:
    Scheduler mScheduler;
};
