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
  char input;

  while (1){
    printf("Enter a single digit: ");
    if (scanf(" %c", &input) != 1){
      printf("Invalid input!\n");
      while (getchar() != '\n');
      continue;
    }

    if (input == 'q'){
      break;
    }

    else if (input >= '0' && input <= '9'){
    //  printf("PASS %d\n", input);
      print_digit(input-48);
    }
    else {
      printf("Invalid Input!\n");
    }
  }
  return 0;
}
