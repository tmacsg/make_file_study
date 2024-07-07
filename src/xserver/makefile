TARGET=xserver
OBJS=xserver.o
CXXFLAGS=-I../xthread -I../xcom
LDFLAGS=-L../xthread -L../xcom
LIBS=-lxthread -lxcom
$(TARGET):$(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS) $(LIBS)
clean:
	@$(RM) $(OBJS) $(TARGET)

.PHONY: clean