#include <iostream>
#include <thread>
#include "xdata.h"

void ThreadMain()
{
    std::cout << "Thread Main" << std::endl;
}

int main()
{
    std::thread t(ThreadMain);
    std::cout << "Hello world" << '\n';
    t.join();
    XData d;
    return 0;
}