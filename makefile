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
