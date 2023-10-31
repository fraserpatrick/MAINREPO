struct employee{
  int employee_number;
  char first_name[20];
  char last_name[20];
  char job_title[30];
  float salary;
};

typedef struct employee Employee;

Employee* new_employee_array(int num);
void enter_details(Employee* ptr);
Employee* get_highest_paid(Employee* arrayPtr, int num);
void delete_employee_array(Employee** arrayPtr);
void print_details(Employee* highestEmp);
