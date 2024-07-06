#include <iostream>
#include "xdata.h"

int main()
{
    std::cout << "Hello world" << '\n';
    XData data;
    extern void test();
    test();
    return 0;
}