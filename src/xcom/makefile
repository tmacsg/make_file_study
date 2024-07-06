TARGET=libxcom.a
OBJS=xcom.o
$(TARGET):$(OBJS)
	$(AR) -cvr $@ $^
	
clean:
	@$(RM) $(OBJS) $(TARGET)

.phony: clean