#makefile.mk
ifndef TARGET
TARGET:=$(notdir $(shell pwd))  
endif
CXXFLAGS:=-I../../include -I../test_gcc -std=c++17 #g++ -c compile auto deduction
LDFLAGS:=-L../xcom -L../xthread # linking,  can be used for auto deduction
LDLIBS:=-lpthread # link libs, can be used for auto deduction
SRCS:=$(wildcard *.cpp *.cc *.c) # test_include.cpp testcpp.cc testc.c
OBJS:=$(patsubst %.cpp, %.o, $(SRCS)) # test_include.o testcpp.cc testc.c
OBJS:=$(patsubst %.cc, %.o, $(OBJS)) # test_include.o testcpp.o testc.c
OBJS:=$(patsubst %.c, %.o, $(OBJS)) # test_include.o testcpp.o testc.o
$(TARGET):$(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) $(OBJS) $(TARGET)

.PHONY: clean
