#test_install/makefile
TARGET=test_install
OBJS=test_install.o
CC:=g++
OUT=out
START_SH=start_$(TARGET)
STOP_SH=stop_$(TARGET)
#make install OUT=../out  
define Install # $(1) TARGET $(2) $(OUT)/bin $(3) para1 $(4) para2 ...
	@echo "begin install $(1)"
	@-mkdir -p $(2)
	@cp $(1) $(2)
	@echo "make start shell"
	@echo "nohup ./$(1) $(3) $(4) $(5) $(6) &" > $(START_SH)
	@chmod +x $(START_SH)
	@cp $(START_SH) $(2)
	@echo "end make start shell"
	@echo "make stop shell"
	@echo "killall $(1)" > $(STOP_SH)
	@chmod +x $(STOP_SH)
	@cp $(STOP_SH) $(2)
	@echo "end make stop shell"
	@echo "$(1) install success!"
endef

# start_test_install
# nohup test_install 3 &

# stop_test_install
# killall test_install

$(TARGET):$(OBJS)
install:$(TARGET)
	$(call Install,$(TARGET),$(OUT)/bin/,2)
#	@echo "begin install $(TARGET)"
#	mkdir -p $(OUT)/bin
#	cp $(TARGET) $(OUT)/bin
#	@echo "$(TARGET) install success!"
clean:
	@$(RM) $(OBJS) $(TARGET) $(START_SH) $(STOP_SH)
	@rm -rf $(OUT)
.PHONY: install clean