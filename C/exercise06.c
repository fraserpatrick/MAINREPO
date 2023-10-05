#include<stdio.h>

static const int digits[10][7] = {{1,1,1,0,1,1,1},{0,0,1,0,0,1,0},{1,0,1,1,1,0,1},{1,0,1,1,0,1,1},{0,1,1,1,0,1,0},{1,1,0,1,0,1,1},{1,1,0,1,1,1,1},{1,0,1,0,0,1,0},{1,1,1,1,1,1,1},{1,1,1,1,0,1,0}};

void print_digit(int digit) {
    printf("\n %c \n",  (digits[digit][0]) ? '-' : ' ');
    printf("%c %c\n", (digits[digit][1]) ? '|' : ' ', (digits[digit][2]) ? '|' : ' ');
    printf(" %c \n",  (digits[digit][3]) ? '-' : ' ');
    printf("%c %c\n", (digits[digit][4]) ? '|' : ' ', (digits[digit][5]) ? '|' : ' ');
    printf(" %c \n",  (digits[digit][6]) ? '-' : ' ');
}

int main(void){
  int input = 'q';

  printf("Enter a single digit: ");
  scanf("%d", &input);

  while (1){
    if (input == 'q'){
      break;
    }
    else if (input >= 0 && input <= 9){
      print_digit(input);
    }
    else {
      printf("Invalid input!\n");
    }
    printf("Enter a single digit: ");
    scanf("%d", &input);
  }
  return 0;
}
