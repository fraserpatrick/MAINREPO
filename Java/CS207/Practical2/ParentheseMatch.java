import java.util.Scanner;

public class ParentheseMatch{
  public static void main(String[] args){
    StackADT<Character> myStack = new ExtendableArrayStack<>();
    Scanner myScanner = new Scanner(System.in);
    System.out.print("Enter String:");
    String input = myScanner.nextLine();
    boolean pass = true;

    for (char i : input.toCharArray()){
      if (i == '(' || i == '{' || i == '['){
        myStack.push(i);
      }
      else if (i == ')' || i == '}' || i == ']'){
        if (myStack.isEmpty()){
          pass = false;
          break;
        }
        if (myStack.top() == '(' && i != ')'){
          pass = false;
        }
        if (myStack.top() == '{' && i != '}'){
          pass = false;
        }
        if (myStack.top() == '[' && i != ']'){
          pass = false;
        }
        myStack.pop();
      }
    }

    if (!myStack.isEmpty()){
      pass = false;
    }
    System.out.println(pass);
  }
}
