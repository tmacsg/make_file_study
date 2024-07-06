#ifndef XTHREAD_H
#define XTHREAD_H
#include <thread>
class XThread
{
public:
    virtual void Start();
    virtual void Wait();
protected:
    virtual void Main()=0;
    std::thread th_;
};

#endif