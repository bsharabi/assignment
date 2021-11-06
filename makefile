FLAGS =-Wall -g

CC =gcc #if we want to change compiler
LibLoop=basicClassification.oadvancedClassificationLoop.o 
LibRec=basicClassification.oadvancedClassificationRecursion.o


all: recursived recursives loopd loops mains maindloop maindrec

#static
mains: main.o libclassrec.a 
	$(CC) $(FLAGS) -o mains main.o libclassrec.a -lm
#dynamic
maindloop:main.o 
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm
#dynamic
maindrec:main.o 
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm
#create static lib
loops: libclassloops.a
#create static lib
recursives:libclassrec.a
#create dynamic lib
recursived:libclassrec.so
#create dynamic lib
loopd:libclassloops.so

libclassloops.a:$(LibLoop) 
	ar -rcs libclassloops.a $(LibLoop)
libclassrec.a:$(LibRec)
	ar -rcs libclassrec.a $(LibRec)  
libclassrec.so:$(LibRec)
	$(CC) $(FLAGS) -shared -o libclassrec.so $(LibRec)
libclassloops.so:$(LibLoop)
	$(CC) $(FLAGS) -shared -o libclassloops.so $(LibLoop)

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c 
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c 
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c 

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c 
	
#.PHONY means that clean is not a file.	
.PHONY: clean
clean:
	rm -f *.o *.a *.so mains maindloop maindrec
