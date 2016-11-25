/* 
By : Johan S. Suarez L. or @jadry92 in twitter
This kernel find the  determinte of the matrix A in variable B 


*/


// Macro for mastrix index
#define Ind(a,i,j) (a)[(j)+(i)*N]

#include <stdio.h>              //manipulacion de ficheros, lectura-escritura ficheros, scandf-printf
#include <stdlib.h>             //Conversion de tipos de datos, memoria dinamica, abs
#include <string.h>             //Uso de memcpy principalmente
#include <math.h>				//funciones matemáticas
#include <time.h>	

/* Funtion check malloc of variables */
void checkMalloc(void * var,const char *name){
	if( var == NULL){
      	printf("It's not possible to allocate  %s. \n",name);}
    else {
     	printf(" Memory has already been allocated %s.\n",name);}
}


int main(int argc, char **argv){
	/* Initiation of variables*/
	int i,j; // i == rows and j == colms
	int N =3;
	float* A;
    float B;



    /* Reservation of memory */

    A = (float*)calloc(N, sizeof(float));
    	checkMalloc(A,"A");

    	/* Initialitation Matix A*/
	
	printf("A =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		Ind(A,i,j) = rand()/(RAND_MAX/10.0);
    		printf(" %f ",Ind(A,i,j));
    	}
    	printf("\n");	
    }	
	
	

}
