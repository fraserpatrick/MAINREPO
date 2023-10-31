#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "employee.h"

Employee* new_employee_array(int num){
  Employee* employeeArray = malloc(sizeof(Employee)*num);
  return employeeArray;

}

void enter_details(Employee* ptr){
  char fName[20] = "";
  char lName[20] = "";
  char job[30] = "";
  float sal = 0.00;
  printf("Enter details of employee %d: ", ptr->employee_number);
  scanf("%s %s %s %f", fName, lName, job, &sal);
  strcpy(ptr->first_name, fName);
  strcpy(ptr->last_name, lName);
  strcpy(ptr->job_title, job);
  ptr->salary = sal;
}

Employee* get_highest_paid(Employee* arrayPtr, int num){
  Employee* high = arrayPtr;
  for (int counter = 0; counter < num-1; counter++){
    if (arrayPtr->salary < (arrayPtr+1)->salary){
      high = arrayPtr+1;
    }
    arrayPtr++;
  }
  return high;
}

void delete_employee_array(Employee** arrayPtr){
  free(*arrayPtr);
  *arrayPtr = NULL;
}

void print_details(Employee* highestEmp){
  printf("----------------------------------\nEmployee Record\n----------------------------------\nEmployee number: %d\nName:\t\t%s, %s\nJob Title:\t%s\nSalary:\t\t%f\n----------------------------------\n",highestEmp->employee_number, highestEmp->last_name, highestEmp->first_name, highestEmp->job_title, highestEmp->salary);
}
