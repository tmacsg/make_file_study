#include <iostream>
#include <thread>
#include <chrono>
int main(int argc, char** argv)
{
    int sec = 1;
    if(argc > 1)
    {
        sec = atoi(argv[1]);
    }
    for(int i = 0;; ++i)
    {
        std::cout << "test install " << i << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(sec));
    }
    return 0;
}