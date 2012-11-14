//Tapasya Patki
//Synthetic - 1
//CPU-bound and scalable

#include <mpi.h>
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>


//Large is 2^32 atm
#define LARGE 42949672960
#define ITERS 4
//Should probably be (LLC_SZ)/(#cores)
//Right now 20MB/32
#define FIXED_SZ 512


int main(int argc, char * argv[]){

	int myrank, numnodes;
	unsigned long mychunk;
	int root = 0;
	int it;
	unsigned long i,j;
	double start, end;
	int t;

	MPI_Init(&argc, &argv);

	MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
	MPI_Comm_size(MPI_COMM_WORLD, &numnodes);

	
	mychunk = (unsigned long) (LARGE/numnodes);

	if(myrank==0){
		printf("\nEach chunk is: %ld", mychunk);
		printf("\nIterations: %d", ITERS);
		printf("\nNodes: %d", numnodes);
	}

	start=MPI_Wtime();

//	MPI_Bcast(&mychunk, 1, MPI_UNSIGNED_LONG, root, MPI_COMM_WORLD);

	for(it=0;it<ITERS;it++){
	 #pragma omp parallel for private(i)
                 for(i=0; i<mychunk; i++){
			//Need to do something memory intensive. Lets just copy one array into another
			//in reverse order. 
			//
			unsigned long *arr1 = (unsigned long *) malloc(FIXED_SZ * sizeof(unsigned long));
			unsigned long *arr2 = (unsigned long *) malloc(FIXED_SZ * sizeof(unsigned long));
			
			for(j=0; j<FIXED_SZ; j++){	
				arr1[j] = j;
			}
			
			//copy
			for(j=0;j<FIXED_SZ; j++){
				arr2[j] = arr1[(FIXED_SZ-1) -j];
			}

			free(arr1);
			free(arr2);
			
		}
	}	
		
	end=MPI_Wtime();

	printf("\nTime is: %lf secs\n", end-start);

	MPI_Finalize();

return 0;
}
