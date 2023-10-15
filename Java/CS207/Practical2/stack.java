import java.util.Scanner;

public class stack{
  public static void main(String[] args){
    StackADT<Integer> myStack = new ArrayStack<>();
    String input = "";
    Scanner myScanner = new Scanner(System.in);

    do{
      System.out.print("Enter command: push, pop, top, size, isEmpty:  ");
      input = myScanner.nextLine();

      switch (input){
        case "push":
          try {
            System.out.print("Enter item:  ");
            int newItem = myScanner.nextShort();
            myStack.push(newItem);
            System.out.println("Adding " + newItem + " to top of stack");
          }
          catch(Exception FullStackException) {
            System.err.println("The stack is full, item not added");
          }
          myScanner.nextLine();
          break;

        case "pop":
          try {
            System.out.println("Popping item " + myStack.pop());
          }
          catch(Exception EmptyStackException) {
            System.err.println("There are no items in the stack, nothing to pop");
          }
          break;

        case "top":
          try{
            System.out.println("The top item is " + myStack.top());
          }
          catch(Exception EmptyStackException) {
            System.err.println("There are no items in the stack");
          }
          break;

        case "size":
          if (myStack.size() == 0){
            System.out.println("There are no items in the stack");
          }
          else if(myStack.size() == 1){
            System.out.println("There is " + myStack.size() + " item in the stack");
          }
          else {
            System.out.println("There are " + myStack.size() + " items in the stack");
          }
          break;

        case "isEmpty":
          if (myStack.isEmpty()){
            System.out.println("There are no items in the stack");
          }
          else {
            System.out.println("There are items in the stack");
          }
          break;

        case "quit":
          input = "quit";
          System.out.println("Quiting program");
          break;

        default:
          System.out.println("Invalid command");
          break;
      }
      System.out.println("");
    }
    while (input != "quit");
  }
}
