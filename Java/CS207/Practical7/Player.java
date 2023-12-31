public class Player implements Comparable<Player> {
  private String name;
  private String team;
  private int score;

  public Player(String newName, String newTeam, int newScore){
    name = newName;
    team = newTeam;
    score = newScore;
  }
  public String getName(){
    return name;
  }

  public String getTeam(){
    return team;
  }

  public int getScore(){
    return score;
  }

  @Override
    public int compareTo(Player newPlayer) {
        return Integer.compare(newPlayer.getScore(), score);
    }
}
