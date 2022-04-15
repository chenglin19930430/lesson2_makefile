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

Step10:
	.PHONY: clean
	CC = gcc
	RM = rm
	EXE = main
	OBJS = main.o 1.o 2.o
	$(EXE): $(OBJS)
		$(CC) -o $(EXE) $(OBJS)
	main.o: main.cpp	
		$(CC) -o main.o -c main.cpp
	1.o: 1.cpp	
		$(CC) -o 1.o -c 1.cpp
	2.o: 2.cpp	
		$(CC) -o 2.o -c 2.cpp
	clean:
		$(RM) $(EXE) $(OBJS)

Step11:
	自动变量（☆☆☆☆☆）
	对于每⼀个规则，⽬标和先决条件的名字会在规则的命令中多次出现，每⼀次出现都是⼀种麻烦，更为麻烦的是，如果改变了⽬标或是依赖的名，那得在命令中全部跟着改。有没有简化这种更改的⽅法呢？这我们需要⽤到 Makefile 中的⾃动变量，最常用包括：

	$@⽤于表示⼀个规则中的⽬标。当我们的⼀个规则中有多个⽬标时，$@所指的是其中任何造成命令被运⾏的⽬标。
	$^则表示的是规则中的所有先择条件。
	$<表示的是规则中的第⼀个先决条件。

	.PHONY:all
	all:first second third
	@echo "\$$@ = $@"
	@echo "\$$^ = $^"
	@echo "\$$< = $<"
 
	.PHONY: clean
	CC = gcc
	RM = rm
	EXE = main
	OBJS = main.o 1.o 2.o
	$(EXE): $(OBJS)
		$(CC) -o $@ $^
	main.o: main.cpp	
		$(CC) -o $@ -c $^
	1.o: 1.cpp	
		$(CC) -o $@ -c $^
	2.o: 2.cpp	
		$(CC) -o $@ -c $^
	clean:
		$(RM) $(EXE) $(OBJS)

Step12:
	"+="操作符，对变量进⾏赋值的⽅法

	.PHONY: all
	objects = main.o foo.o bar.o utils.o
	objects += another.o
	all:
		@echo $(objects)

Step12:
	模式
	如果对于每⼀个⽬标⽂件都得写⼀个不同的规则来描述，那会是⼀种“体⼒活”，太繁了！
	对于⼀个⼤型项⽬，就更不⽤说了。Makefile 中的模式就是⽤来解决我们的这种烦恼的。

	.PHONY: clean
	CC = gcc
	RM = rm
	EXE = main
	OBJS = main.o 1.o 2.o
	$(EXE): $(OBJS)
		$(CC) -o $@ $^
	%.o: %.cpp	
		$(CC) -o $@ -c $^
	clean:
		$(RM) $(EXE) $(OBJS)	

Step13:
	函数
	采⽤了 wildcard 和 patsubst 两个函数后 simple 项⽬的 Makefile。
	可以先⽤它来编译⼀下 simple 项⽬代码以验证其功能性。
	需要注意的是函数的语法形式很是特别，对于我们来说只要记住其形式就⾏了。

	patsubst 函数是⽤来进⾏字符串替换的，其形式是：$(patsubst pattern, replacement, text)
	wildcard 是通配符函数，通过它可以得到我们所需的⽂件，这个函数类似我们在 Windows 或Linux 命
令⾏中的“*”。其形式是：$(wildcard pattern)

	.PHONY: clean
	CC = gcc
	RM = rm
	EXE = main
	SRCS = $(wildcard *.cpp)
	OBJS = $(patsubst %.cpp,%.o,$(SRCS))
	#OBJS = main.o 1.o 2.o
	$(EXE): $(OBJS)
		$(CC) -o $@ $^
	%.o: %.cpp	
		$(CC) -o $@ -c $^
	clean:
		$(RM) $(EXE) $(OBJS)


	
	










