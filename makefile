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
