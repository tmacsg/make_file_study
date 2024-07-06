#include <iostream>

extern void TestCPP();
extern "C" void TestC();

int main(int argc, char** argv)
{
    std::cout << "Hello world" << '\n';
    TestCPP();
    TestC();
    return 0;
}