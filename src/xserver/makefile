TARGET=xserver
OBJS=xserver.o
CXXFLAGS=-I../xthread
LDFLAGS=-L../xthread
LIBS=-lxthread 
$(TARGET):$(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS) $(LIBS)
clean:
	@$(RM) $(OBJS) $(TARGET)

.phony: clean