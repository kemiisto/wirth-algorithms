ifeq ($(OS),Windows_NT)
	CP = copy
	RM = del /q
else
	CP = cp
	RM = rm -f
endif

all: test_search
	
TEST_SEARCH = Search.k TestSearch.k
test_search: $(TEST_SEARCH)
	obc -o TestSearch Test.k $(TEST_SEARCH)

TestSearch.k: Search.k

%.k: %.m
	obc -c $<

clean:
	$(RM) *.k