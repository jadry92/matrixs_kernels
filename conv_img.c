#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[]){

// leer argumentos de entrada en el ejcutable
//-----------------------------------------------------------------

	for (int i = 0; i < argc; ++i)
		{
			printf("%s\n", argv[i]);
		}	
	int entrada;

	entrada = atoi(argv[2]); 

	printf("%d\n",entrada);
	
//-----------------------------------------------------------------

// leer argumentos de entrada en el ejcutable
//-----------------------------------------------------------------

	for (int i = 0; i < argc; ++i)
		{
			printf("%s\n", argv[i]);
		}	
	int entrada;

	entrada = atoi(argv[2]); 

	printf("%d\n",entrada);
	
//-----------------------------------------------------------------
//tipos de variables y sizeof
//------------------------------------------------------------------

	int a1[100];
	unsigned int a2;
	long int a3;
	unsigned long int a4;
	float a5;
	double a6;	
	char a7;

	printf("%ld\n",sizeof(a1));

	
	printf("cosas nuevas\n");
	printf("y mas cosas\n");
	
	int a1[3]={1,2,3};

	int *a2;

	a2 = a1;

	for (int i = 0; i < 3; ++i){
		printf(" %d | %d \n", a1[i],a2[i]);
	}
	printf("%d\n",*(a2+4));


	int nx=100;
	int nz=100;
	int img[nx][nz][3];

	int fil[3][3] =  {{1,1,1},{1,1,1},{1,1,1}};

	for (int ix = 0; ix < nx; ++ix){
		for (int iz = 0; iz < nx; ++iz){
			if(ix >0  && iz > 0 && iz < nz && ix < nx ){
				img[ix][iz][0] = (fil[0][0]*img[ix-1][iz-1][0] + fil[1][0]*img[ix][iz-1][0]
				+ fil[2][0]*img[ix+1][iz-1][0] + fil[0][1]*img[ix-1][iz][0]+
				fil[1][1]*img[ix][iz][0] + fil[2][1]*img[ix+1][iz][0] +
				fil[0][2]*img[ix-1][iz+1][0] + fil[1][2]*img[ix][iz+1][0] + 
				fil[2][2]*img[ix+1][iz+1][0])/9;
			}
		}
	}

	return 0;
}
