/* 
By : Johan S. Suarez L. or @jadry92 in twitter
This kernel find the  determinte of the matrix A in variable B 


*/







#include <stdio.h>              //manipulacion de ficheros, lectura-escritura ficheros, scandf-printf
#include <stdlib.h>             //Conversion de tipos de datos, memoria dinamica, abs
#include <string.h>             //Uso de memcpy principalmente
#include <math.h>				//funciones matemáticas
#include <time.h>	
#include <cuda_runtime.h>       //
#include <sys/time.h>           //
#include <unistd.h>             //

// Macro for mastrix index
#define Ind(a,i,j) (a)[(j)+(i)*N]


double timeval_diff(struct timeval *a, struct timeval *b){
    return (double)(a->tv_sec + (double)a->tv_usec/1000000) - (double)(b->tv_sec + (double)b->tv_usec/1000000);
}

/* Funtion check malloc of variables */
void checkMalloc(void * var,const char *name){
	if( var == NULL){
      	printf("\nIt's not possible to allocate  %s. \n",name);}
    else {
     	printf("\nMemory has already been allocated %s.\n",name);}
}




//float det_2x2(float *A){
//    float det;
//    det = Ind(A,,)*Ind(A,,)-Ind(A,,)*Ind(A,,);
//}

int main(int argc, char **argv){
	/* Initiation of variables*/
	int i,j; // i == rows and j == colms
	int N =3;
	float* A;
    float det;
    int k;
    int count = N;
    struct timeval t_ini, t_fin;
    double time_full;   

    /* Reservation of memory */

    A = (float*)malloc(N*N*sizeof(float));
    	checkMalloc(A,"A");
    float a[9]= {0,1,2,2,5,5,7,7,0};
    	/* Initialitation Matix A*/
	memcpy(A,&a,N*N*sizeof(float));
	printf("Initialitation Matix A \n");
    for(i = 0; i < N; i++){
    	for(j = 0; j < N ; j++){
    		//Ind(A,i,j) = {0,1,2,2,5,5,7,7,0};//rand()/(RAND_MAX/10.0);
    		printf(" %f",Ind(A,i,j));
    	}
    	printf("\n");	
    }	

    printf("Strat Compute\n");
    gettimeofday(&t_ini, NULL);
    det = Ind(A,0,0);
    for (k = 0; k < count-1;++k){      
        for(i = k+1; i < N; i++){
            for(j = k+1; j < N; j++){
                Ind(A,i,j)=(Ind(A,k,k)*Ind(A,i,j)-Ind(A,k,j)*Ind(A,i,k))/Ind(A,k,k);
            }
            det = det*Ind(A,k+1,k+1);
        }    
//        det = det*Ind(A,k+1,k+1);
    }
}
    gettimeofday(&t_fin, NULL);
    time_full = timeval_diff(&t_fin, &t_ini);   
    printf("\nTime of compute =%f [s] \n",time_full);
    printf("\nTime of compute =%f [min] \n",time_full/60.0);

    printf("\ndet = %f\n",det );

}
