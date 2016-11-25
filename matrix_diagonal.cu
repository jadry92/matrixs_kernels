/* 
By : Johan S. Suarez L. or @jadry92 in twitter
This kernel takes the diagonals elements of the matrix  A in the vector B 


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
    float* B;



    /* Reservation of memory */

    A = (float*)calloc(N, sizeof(float));
    	checkMalloc(A,"A");
	B = (float*)calloc(N, sizeof(float));
		checkMalloc(B,"B");

	/* Initialitation Matix A*/

	printf("A =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		Ind(A,i,j) = rand()/(RAND_MAX/10.0);
    		printf(" %f ",Ind(A,i,j));
    	}
    printf("\n");	
    }

    /* Gaussian Elimination*/
    // The B has to be identity matrix
    memset(B,0.0,N*sizeof(float));
    for(i = 0; i < N; i++){
    	Ind(B,i,i) = 1.0;	
    }
    printf("B =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		printf(" %f ",Ind(B,i,j));
    	}
    printf("\n");	
    }

    int y;
    float key;
    for(i = 0; i < N; i++){ // for to rows
    	for(j = 0; j <N  ; j++){
    		y=0;
    		if(i==j){

    		}else{
    		while(y<N){
    	 		if(i+1<N ){
    	 			Ind(A,i,j+y) = Ind(A,i,j+y) - Ind(A,i+1,j+y)*(Ind(A,i,j)/Ind(A,i+1,j));
    				Ind(B,i,j+y) = Ind(B,i,j+y) - Ind(B,i+1,j+y)*(Ind(A,i,j)/Ind(A,i+1,j));
    			}else{
    				Ind(A,i,j+y) = Ind(A,i,j+y) - Ind(A,i-N-1+y,j+y)*(Ind(A,i,j)/Ind(A,i-N-1,j));
    				Ind(B,i,j+y) = Ind(B,i,j+y) - Ind(B,i-N-1+y,j+y)*(Ind(A,i,j)/Ind(A,i-N-1,j));
    			}	
  				y++;
    		}
    		}	
    	 		//Ind(A,i,j) = 1;
    			//Ind(B,i,j) = Ind(B,i,j)/Ind(A,i,j);
    		//}
    	}
    }				

	printf("A =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		printf(" %f ",Ind(A,i,j));
    	}
    printf("\n");	
    }

    printf("B =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		printf(" %f ",Ind(B,i,j));
    	}
    printf("\n");	
    }
    /* Descompotition LU*/


	return 0;
}
