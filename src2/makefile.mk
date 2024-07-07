#makefile.mk
ifndef TARGET
TARGET:=$(notdir $(shell pwd))
endif
CXXFLAGS:=$(CXXFLAGS) -I../../include -std=c++17 #g++ -c compile auto deduction
LDFLAGS:=$(LDFLAGS) # linking,  can be used for auto deduction
LDLIBS:=$(LDLIBS) # link libs, can be used for auto deduction
# /usr/bin /usr/lib /usr/include
OUT:=/usr

SRCS:=$(wildcard *.cpp *.cc *.c) # test_include.cpp testcpp.cc testc.c
OBJS:=$(patsubst %.cpp, %.o, $(SRCS)) # test_include.o testcpp.cc testc.c
OBJS:=$(patsubst %.cc, %.o, $(OBJS)) # test_include.o testcpp.o testc.c
OBJS:=$(patsubst %.c, %.o, $(OBJS)) # test_include.o testcpp.o testc.o

# check dynamic/static lib or exe
ifeq ($(LIBTYPE), .so) # dynamic lib, $(strip $(TARGET)) removes spaces/\t
	TARGET:=lib$(strip $(TARGET)).so
	LDLIBS:=$(LDLIBS) -shared
	CXXFLAGS:=$(CXXFLAGS) -fPIC
endif

ifeq ($(LIBTYPE), .a)  # static lib
	TARGET:=lib$(strip $(TARGET)).a

	LDLIBS:=$(LDLIBS) -shared
	CXXFLAGS:=$(CXXFLAGS) -fPIC
endif

START_SH=start_$(TARGET)
STOP_SH=stop_$(TARGET)

define Install # $(1) TARGET $(2) $(OUT)/bin
	@echo "begin install $(1)"
	@-mkdir -p $(2)
	@cp $(1) $(2)
	@echo "$(1) install success!"
endef

define InstallSH # $(1) TARGET $(2) $(OUT)/bin $(3) para1 $(4) para2 ...
	@echo "begin make start shell"
	@echo "nohup $(1) $(3) &" > $(START_SH)
	@chmod +x $(START_SH)
	@cp $(START_SH) $(2)
	@echo "end make start shell"

	@echo "make stop shell"
	@echo "killall $(1)" > $(STOP_SH)
	@chmod +x $(STOP_SH)
	@cp $(STOP_SH) $(2)
	@echo "end make stop shell"
endef

$(TARGET):$(OBJS)
ifeq ($(LIBTYPE), .a) # static lib
	ar -cvr $@ $^
else
	$(CXX) $^ -o $@ $(LDFLAGS) $(LDLIBS)
endif

install: $(TARGET)
ifdef LIBTYPE
	$(call Install,$(TARGET),$(OUT)/lib)
	$(call Install,*.h,$(OUT)/include)
else
	$(call Install,$(TARGET),$(OUT)/bin)
	$(call InstallSH,$(TARGET),$(OUT)/bin)
endif

uninstall: clean
ifndef LIBTYPE
	-$(STOP_SH)
	$(RM) $(OUT)/bin/$(TARGET)
	$(RM) $(OUT)/bin/$(START_SH)
	$(RM) $(OUT)/bin/$(STOP_SH)
else
	$(RM) $(OUT)/lib/$(TARGET)
endif

clean:
	$(RM) $(OBJS) $(TARGET)
ifndef LIBTYPE
	$(RM) $(START_SH) $(STOP_SH)
endif

.PHONY: clean uninstall install
