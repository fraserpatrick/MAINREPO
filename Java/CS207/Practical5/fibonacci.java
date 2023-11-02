import java.util.Scanner;

public class fibonacci {
  public static void main(String[] args){
    String input = "";
    int number = 0;
    Scanner myScanner = new Scanner(System.in);

    do{
      System.out.print("Enter command: iterative, recursive or quit:  ");
      input = myScanner.nextLine();

      switch (input){
        case "iterative":
        System.out.print("Enter a number:  ");
        number = myScanner.nextShort();
        System.out.println("Output: "+iterativeMethod(number-1));
        myScanner.nextLine();
        break;

        case "recursive":
        System.out.print("Enter a number:  ");
        number = myScanner.nextShort();
        System.out.println("Output: "+recursiveMethod(number));
        myScanner.nextLine();
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

  public static int iterativeMethod(int location){
    int temp1 = 0;
    int temp2 = 1;
    int output = 1;
    if (location < 0){
      return 0;
    }
    for (int counter = 0; counter != location; counter++){
      output = temp1 + temp2;
      temp1 = temp2;
      temp2 = output;
    }
    return output;
  }

  public static int recursiveMethod(int location){
    if (location < 1){
      return 0;
    }
    if (location == 1 || location == 2){
      return 1;
    }
    else{
      return recursiveMethod(location-1)+recursiveMethod(location-2);
    }
  }
}
