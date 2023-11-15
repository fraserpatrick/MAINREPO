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

    for (int i = 0; i < playersList.size()-1; i++) {
        for (int j = 0; j < playersList.size()-i-1; j++) {
            if (playersList.get(j).getScore() < playersList.get(j+1).getScore()) {
                Player temp = playersList.get(j);
                playersList.set(j, playersList.get(j+1));
                playersList.set(j+1,temp);
                }
            }
        }
    System.out.println("----------Sorted By Highest Score----------");
    for (Player x : playersList){
      System.out.print(x.getName()+" ");
      System.out.print(x.getTeam()+" ");
      System.out.println(x.getScore());
    }
  }
}
