#include <stdio.h>
#include "Employee.h"

int main(void) {
	Employee *employees;
	int n_employees;

	do {
	printf("How many employees? ");
	}
	while(!scanf(" %d", &n_employees) && n_employees > 0);

	employees = new_employee_array(n_employees);

	for(int i = 0; i < n_employees; i++){
		employees[i].employee_number = i+1;
		enter_details(employees+i);
	}

	printf("\nThis is the highest paid employee:\n");

	Employee *highest = get_highest_paid(employees, n_employees);

	print_details(highest);

	delete_employee_array(&employees);

	if(!employees) {
		printf("\nEmployee array deleted!\n");
	} else {
		printf("\nEmployee array not deleted! :(\n");
	}

  return 0;
}
