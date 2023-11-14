import java.util.Scanner;
import java.io.*;
import java.util.List;
import java.util.ArrayList;
import java.util.NoSuchElementException;

public class playerApp {

  public static void main(String[] args){
    String newName;
    String newTeam;
    int newScore;
    List<Player> playersList = new ArrayList<>();

    try (Scanner reader = new Scanner(new File("Players.txt"))){
      while (reader.hasNext()){
        newName = reader.next();
        newTeam = reader.next();
        newScore = reader.nextInt();
        playersList.add(new Player(newName,newTeam,newScore));
      }
    }

    catch (FileNotFoundException e){
      System.out.println("NO FILE FOUND");
    }

    catch (NoSuchElementException e){
      System.out.println("MISSING ITEM");
    }

    for (Player x : playersList){
      System.out.print(x.getName()+" ");
      System.out.print(x.getTeam()+" ");
      System.out.println(x.getScore());
    }

  }
}
