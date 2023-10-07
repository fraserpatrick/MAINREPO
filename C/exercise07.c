#include <stdio.h>

void print_array(int* ptr, int len);

void print_2d_array(char* ptr, int xlen, int ylen);

int main(){
	
	int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	print_array(arr, 10);
	
	/*This part tests print_2d_array, uncomment it when print_array is working

	char arr2[4][5] = {
		{'A', 'B', 'C', 'D', 'E'},
		{'F', 'G', 'H', 'I', 'J'},
		{'K', 'L', 'M', 'N', 'O'},
		{'P', 'Q', 'R', 'S', 'T'},
	};
	
	print_2d_array(*arr2, 4, 5);
	
		*/

}

