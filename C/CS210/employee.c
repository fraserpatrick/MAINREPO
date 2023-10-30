#include <stdio.h>
#include "employee.h"



void new_employee_array(int num){
  struct employee employee_array[num];
}
void print_details(struct employee emp){
  printf("%d", emp.employee_number);
}
