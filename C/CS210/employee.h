struct employee{
  int employee_number;
  char first_name[20];
  char last_name[20];
  char job_title[20];
  float salary;
};
struct employee* new_employee_array(int num);
void enter_details(struct employee* ptr);
void get_highest_paid();
void delete_employee_array();
void print_details(struct employee* employee);
