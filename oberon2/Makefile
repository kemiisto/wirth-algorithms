ifeq ($(OS),Windows_NT)
	CP = copy
	RM = del /q
else
	CP = cp
	RM = rm -f
endif

all: Test.k
	$(CP) Test.k ch01
	$(MAKE) -C ch01

%.k: %.m
	obc -c $<

clean:
	$(RM) *.k
	$(MAKE) -C ch01 clean