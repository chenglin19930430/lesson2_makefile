.PHONY: clean
CC = gcc
RM = rm
EXE = main
OBJS = main.o 1.o 2.o
$(EXE): $(OBJS)
	$(CC) -o $(EXE) $(OBJS)
main.o: main.cpp	
	gcc -o main.o -c main.cpp
1.o: 1.cpp	
	gcc -o 1.o -c 1.cpp
2.o: 2.cpp	
	gcc -o 2.o -c 2.cpp
clean:
	$(RM) $(EXE) $(OBJS)
