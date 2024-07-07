TARGET=libxcom
OBJS=xcom.o

ifeq ($(STATIC),1)
# static lib
TARGET:=$(TARGET).a
$(TARGET):$(OBJS)
	$(AR) -cvr $@ $^
else
# dynamic lib
TARGET:=$(TARGET).so
LDFLAGS=-shared
CXXFLAGS=-fPIC
$(TARGET):$(OBJS)
	$(CXX) $(LDFLAGS) $^ -o $@
endif

clean:
	@$(RM) $(OBJS) $(TARGET)

.PHONY: clean