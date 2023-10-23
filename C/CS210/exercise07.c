#include <stdio.h>

void print_array(int *ptr, int len){
	int counter;
	for (counter = 0; counter != len-1; counter++){
		printf("%d, ", *(ptr + counter));
	}
	printf("%d\n", *(ptr + counter));
}

void print_2d_array(char* ptr, int ylen, int xlen){
	int mainCounter;
	int lineCounter = 1;
	for (mainCounter = 0; mainCounter != xlen*ylen; mainCounter++){
		if (lineCounter == xlen){
			printf("%c\n", *(ptr + mainCounter));
			lineCounter = 1;
		}
		else {
			printf("%c, ", *(ptr + mainCounter));
			lineCounter++;
		}
	}
}

int main(){

	int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

	print_array(arr, 10);

	char arr2[4][5] = {
		{'A', 'B', 'C', 'D', 'E'},
		{'F', 'G', 'H', 'I', 'J'},
		{'K', 'L', 'M', 'N', 'O'},
		{'P', 'Q', 'R', 'S', 'T'},
	};

	print_2d_array(*arr2, 4, 5);

}
