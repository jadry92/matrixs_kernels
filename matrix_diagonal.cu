/* 
By : Johan S. Suarez L. or @jadry92 in twitter
This kernel takes the diagonals elements of the matrix  A in the vector B 


*/


#include <stdio.h>              //manipulacion de ficheros, lectura-escritura ficheros, scandf-printf
#include <stdlib.h>             //Conversion de tipos de datos, memoria dinamica, abs
#include <string.h>             //Uso de memcpy principalmente
#include <math.h>				//funciones matemáticas
#include <time.h>
#include <unistd.h>
#include <cuda_runtime.h>
#include <sys/time.h>

// Macro for mastrix index
#define Ind(a,i,j) (a)[(j)+(i)*N]

/* Function check malloc of variables */
void checkMalloc(void * var,const char *name){
	if( var == NULL){
      	printf("It's not possible to allocate  %s. \n",name);}
    else {
     	printf(" Memory has already been allocated %s.\n",name);}
}

/* Function take the time */
double timeval_diff(struct timeval *a, struct timeval *b){
  return (double)(a->tv_sec + (double)a->tv_usec/1000000) - (double)(b->tv_sec + (double)b->tv_usec/1000000);
}

__global__ void kernel(float *d_A,float *d_B,int N){
	
	/* Thread index */
	int id = threadIdx.x + blockIdx.x*blockDim.x;

	Ind(d_B,id,id) = 1/sqrt(Ind(d_A,id,id));
}

int main(int argc, char **argv){
	/* Initiation of variables*/
	int i,j; // i == rows and j == colms
	int N =3;
	float* h_A;
    float* h_B;
	struct timeval t_ini, t_fin;
	double full_time;




    /* Reservation of memory */


    h_A = (float*)calloc(N, sizeof(float));
    	checkMalloc(h_A,"h_A");
	h_B = (float*)calloc(N, sizeof(float));
		checkMalloc(h_B,"h_B");


	/* Initialitation Matix A*/

	printf("  A =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		Ind(h_A,i,j) = rand()/(RAND_MAX/10.0);
    		printf(" %f ",Ind(h_A,i,j));
    	}
    printf("\n");	
    }

    memset(h_B,0.0,N*N*sizeof(float));

    /* Take Diagonal points of Matrix A and set in matrix
	B through the ecuation 1/sqrt(D(A))
    */
		/* Start take the time*/
	gettimeofday(&t_ini, NULL);

 	for(i = 0: i < N ){
 		if(Ind(h_A,i,i)!=0){
 			Ind(h_B,i,i) = 1.0/sqtr(Ind(h_A,i,i));
 		}
 	}

 	gettimeofday(&t_fin, NULL);
	full_time = timeval_diff(&t_fin, &t_ini);
	printf("Time CPU = %f [s]\n",full_time);


    printf("B =\n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		printf(" %f ",Ind(B,i,j));
    	}
    printf("\n");	
    }


	/* Free Memory*/
	free(A);
	free(B);

	return 0;
}
