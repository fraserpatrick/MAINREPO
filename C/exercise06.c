#include<stdio.h>

static const int digits[10][7] = {}

int main(void){
  int input = 0;
  prinf("Enter a single digit: ")
  scanf("%d", input)

  return 0;
}

void print_digit(int digit) {
    printf("\n %c \n",  (digits[digit][0]) ? '-' : ' ');
    printf("%c %c\n", (digits[digit][1]) ? '|' : ' ', (digits[digit][2]) ? '|' : ' ');
    printf(" %c \n",  (digits[digit][3]) ? '-' : ' ');
    printf("%c %c\n", (digits[digit][4]) ? '|' : ' ', (digits[digit][5]) ? '|' : ' ');
    printf(" %c \n",  (digits[digit][6]) ? '-' : ' ');
}
