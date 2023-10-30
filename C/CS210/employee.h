struct employee{
  int employee_number;
  char first_name[20];
  char last_name[20];
  char job_title[20];
  float salary;
};
void new_employee_array(n_employees);
void enter_details();
void get_highest_paid();
void delete_employee_array();
void print_details(struct employee);
