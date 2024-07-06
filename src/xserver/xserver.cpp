#include <iostream>
#include "xthread.h"

class XTast: public XThread
{
protected:
    void Main() override
    {
        std::cout << "XTask main" << '\n';
    }
};

int main(int argc, char** args)
{
    std::cout << "XServer" << '\n';
    XTast task;
    task.Start();
    task.Wait();
    return 0;
}