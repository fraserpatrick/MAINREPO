#include <stdio.h>

int str_len(char* str){
	int counter = 0;
	while (*(str+counter) != '\0'){
		counter++;
	}
	return counter;
}

char *str_rev_and_copy(char *src, char *dest){
  int counter1 = str_len(src)-1;
  int counter2 = 0;
  *(dest+counter1+1) = '\0';

  while (counter1 != -1){
    *(dest+counter1) = *(src+counter2);
    counter1--;
    counter2++;
  }
  return dest;
}

char *str_rev(char *str){
	char temp[25] = "";
	int counter1 = str_len(str)-1;
  int counter2 = 0;

	while (counter1 != -1){
    *(temp+counter1) = *(str+counter2);
    counter1--;
    counter2++;
  }
	str = temp;
	return str;
}

int str_cmp(char *str1, char *str2){
	for (int i = 0; i < str_len(str1); i++){
		if (*(str1+i) > *(str2+i)){
			return 1;
		}
		else if (*(str1+i) < *(str2+i)){
			return -1;
		}
	}
	return 0;
}

char *str_trim(char *str) {
    int start = 0;
    int end = 0;
		int counter2 = 0;
		char temp[100] = "";

    while (str[start] == ' ' || str[start] == '\t' || str[start] == '\n') {
        start++;
    }

		end = start;
		while (str[end] != '\0'){
			end++;
			printf("%d\n", end);
		}
		end--;
    while (str[end] == ' ' || str[end] == '\t' || str[end] == '\n') {
        end--;
				printf("%d\n", end);
    }
		for (int counter = start; counter != end; counter++){
			printf("%d    %d\n", counter, counter2);
			*(temp+counter2) = *(str+counter);

			counter2++;

		}
		str = temp;
    return str;
}

int main(){
  char* task1Str1 = "Hello";
  char task1Str2[25] = "XXXXXXXXXXXX";
	char* task2Str = "Hello";
	char* task3Str1 = "ABC";
	char* task3Str2 = "ABC";
	char* task4Str = "     \t\t\nHello, World!\n\n\tGoodbye, World!   \t\n  ";

  printf("TASK1:  %s\n",str_rev_and_copy(task1Str1, task1Str2));
	printf("TASK2:  %s\n",str_rev(task2Str));
	printf("TASK3:  %d\n",str_cmp(task3Str1, task3Str2));
	printf("%s\n",str_trim(task4Str));
	printf("Hello, World!\n\n\tGoodbye, World!\n");
  return 0;
}
