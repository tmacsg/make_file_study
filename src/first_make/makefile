# first_make
# $^ 依赖 不重复
# $@ 目标
# @ 不显示命令执行, 被注释的命令前面也可加，例如@#
# - 命令前面加-，如果命令失败，会继续往下执行

TARGET=first_make
LIBS=-lpthread
OBJS=first_make.o xdata.o
CXXFLAGS=-I../test_gcc
$(TARGET): $(OBJS)
	@# -@rm non_exsising_file  
	@echo "begin build $(TARGET)"
	$(CXX) $^ -o $@ $(LIBS) 
	@echo "$(TARGET) build success!"

clean:
	@$(RM) $(OBJS) $(TARGET)

.PHONY: clean
