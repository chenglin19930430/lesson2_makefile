# lesson2_makefile
makefile详解 https://www.cnblogs.com/paul-617/p/15501875.html

Step1:
	all:
		echo "Hello world"

Step2:
	all:
		echo "Hello world"
	test:
		echo "test game"

Step3:
	all:
		@echo "Hello world"
	test:
		@echo "test game"

Step4:
	all:
		@echo "Hello world"
	test:
		@echo "test game"

Step5:
	all: test
		@echo "Hello world"
	test:
		@echo "test game"

Step6:
	rm main;gcc main.cpp 1.cpp 2.cpp -o main;./main

Step7:
	all: main.o 1.o 2.o	
		gcc -o main main.o 1.o 2.o
	main.o: main.cpp	
		gcc -o main.o -c main.cpp
	1.o: 1.cpp	
		gcc -o 1.o -c 1.cpp
	2.o: 2.cpp	
		gcc -o 2.o -c 2.cpp
	clean:	
		rm main main.o 1.o 2.o

Step8:
	main: main.o 1.o 2.o	
		gcc -o main main.o 1.o 2.o
	main.o: main.cpp	
		gcc -o main.o -c main.cpp
	1.o: 1.cpp	
		gcc -o 1.o -c 1.cpp
	2.o: 2.cpp	
		gcc -o 2.o -c 2.cpp
	clean:	
		rm main main.o 1.o 2.o

Step9:
	.PHONY: clean
	main: main.o 1.o 2.o	
		gcc -o main main.o 1.o 2.o
	main.o: main.cpp	
		gcc -o main.o -c main.cpp
	1.o: 1.cpp	
		gcc -o 1.o -c 1.cpp
	2.o: 2.cpp	
		gcc -o 2.o -c 2.cpp
	clean:	
		rm main main.o 1.o 2.o





