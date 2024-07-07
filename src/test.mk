#test.mk
LDIR=$(shell pwd)
LSS=$(shell ls)
OUT:=out 
INIT=$(shell if [ ! -d $(OUT) ]; then mkdir $(OUT); fi;)
test:
	@echo $(LDIR)
	@echo $(LSS)
	@echo -n $(INIT)