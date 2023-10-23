#include <stdio.h>

int str_len(char* str){
	int counter = 0;
	while (*(str+counter) != '\0'){
		counter++;
	}
	return counter;
}

char *str_rev_and_copy(char *src, char *dest){
  int counter1 = str_len(src);
  int counter2 = 0;
  *(dest+counter1+1) = '\0';

  while (counter1 != -1){
    printf("%d  %d\n", counter1, counter2);
    printf("%c\n", *(src+counter2));
    *(dest+counter1) = *(src+counter2);
    counter1--;
    counter2++;
    printf("%s\n", dest);
  }
  return dest;
}

int main(){
  char* str1 = "Hello";
  char str2[100] = "XXXXXXXXXXXX";

  str_rev_and_copy(str1, str2);
  printf("Copied from:\t%s\nCopied to:\t%s\n", str1, str2);
  return 0;
}
