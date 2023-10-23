#include <stdio.h>

int str_len(char* str){
	int counter = 0;
	while (*(str+counter) != '\0'){
		counter++;
	}
	return counter;
}

void str_cpy(char* src, char* dest){
	int counter = 0;
	while (counter != str_len(src)){
		*(dest+counter) = *(src+counter);
		counter++;
	}
	*(dest+counter+1) = '\0';
}

int main(){
	char* str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	printf("%s is %d characters long!\n", str, str_len(str));

	char str2[100] = "XXXXXXXXXXXXXXXXXXXXXXXXXX   If you're reading this, you probably forgot a '\\0'!";

	str_cpy(str, str2);

	printf("Copied from:\t%s\nCopied to:\t%s", str, str2);
	return 0;
}
