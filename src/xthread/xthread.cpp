#include "xthread.h"
#include <iostream>

void XThread::Start()
{
    std::cout << "Start Thread" << std::endl;
    th_ = std::thread(&XThread::Main, this);
}

void XThread::Wait()
{
    std::cout << "Begin wait thread" << std::endl;
    th_.join();
    std::cout << "End wait thread" << std::endl;
}