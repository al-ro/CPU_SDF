
main: main.C
	@echo "Compiling..."
	g++-6 -O0 -g -Wextra  -Wall -pedantic -std=c++11 \
		$^ -o $@ \

.PHONY: all
all: main test

test: test.C
	@echo "Compiling..."
	g++-6 -O0 -g -Wextra  -Wall -pedantic -std=c++11 \
	       	-I/lsc/opt/modules/gcc-6.4.0/boost-1.63.0/include/ \
		$^ -o $@ \
		-lboost_unit_test_framework -L/lsc/opt/modules/gcc-6.4.0/boost-1.61.0/lib  

.PHONY: clean
clean:
	rm -rf test main

.PHONY: memtest
memtest:
	valgrind --leak-check=full --track-origins=yes ./main
