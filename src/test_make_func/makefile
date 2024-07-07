TARGET=test_make_func
SRC:=$(wildcard *.cpp)
OBJS=$(patsubst %.cpp, %.o, $(SRC))
$(TARGET): $(OBJS)
	@echo $(OBJS)
	$(CXX) $^ -o $@

clean:
	@$(RM) $(OBJS) $(TARGET)

.PHONY: clean