import java.io.*;
import java.util.*;

public class App{
	public static void main(String[] args){
		int node1, node2 = 0;
		GraphADT graph = new Graph(10);
		
		try (Scanner reader = new Scanner(new File("Edges.txt"))){
			while (reader.hasNext()){
				node1 = reader.nextInt();
				node2 = reader.nextInt();
				graph.addEdge(node1,node2);
			}
		}
		
		catch (FileNotFoundException e){
			System.out.println("NO FILE FOUND");
		}
		
		System.out.println("0: "+graph.neighbours(0));
		System.out.println("1: "+graph.neighbours(1));
		System.out.println("2: "+graph.neighbours(2));
		System.out.println("3: "+graph.neighbours(3));
		System.out.println("4: "+graph.neighbours(4));
		System.out.println("5: "+graph.neighbours(5));
		System.out.println("6: "+graph.neighbours(6));
		System.out.println("7: "+graph.neighbours(7));
		System.out.println("8: "+graph.neighbours(8));
		System.out.println("9: "+graph.neighbours(9));
		
		Scanner myScan = new Scanner(System.in);
		String input = "";
		do{
			System.out.print("Enter command: Breath, Depth or Quit:  ");
			input = myScan.nextLine();

			switch (input){
				case "Breadth":
					breadth();
					break;


				case "Depth":
					depth();
					break;


				case "Quit":
					input = "Quit";
					System.out.println("Quiting program");
					break;

				default:
					System.out.println("Invalid command");
					break;
			}
			System.out.println("");
		}
		while (input != "Quit");
	}
	
	public static void depth(){
		System.out.println("DEPTH");
	}
	
	public static void breadth(){
		System.out.println("BREADTH");
	}
}
