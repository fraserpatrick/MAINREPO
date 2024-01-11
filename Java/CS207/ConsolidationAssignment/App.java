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
		
		Scanner myScan = new Scanner(System.in);
		String input = "";
		do{
			System.out.print("Enter command: Breath, Depth or Quit:  ");
			input = myScan.nextLine();

			switch (input){
				case "Breadth":
					breadth(graph);
					break;


				case "Depth":
					depth(graph);
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
	
	public static void depth(GraphADT graph){
		System.out.println("-----Depth-first transversal-----");
		
		Stack<Integer> nodeStack = new Stack<>();
        boolean[] visited = new boolean[graph.nNodes()];
		int avgDegree = 0;

        nodeStack.push(0);

        while (nodeStack.isEmpty() == false) {
            int currentNode = nodeStack.pop();

            if (visited[currentNode] == false) {
                System.out.println("Node: " + currentNode + ", Degree: " + graph.degree(currentNode));
				avgDegree = avgDegree + graph.degree(currentNode);
				
                visited[currentNode] = true;

                for (int neighbor : graph.neighbours(currentNode)) {
                    if (visited[neighbor] == false) {
                        nodeStack.push(neighbor);
					}
				}
			}
		}
		System.out.println("Average degree: "+avgDegree/graph.nNodes());
    }
	
	public static void breadth(GraphADT graph){
		System.out.println("-----Breadth-first transversal-----");
		
		Queue<Integer> nodeQueue = new LinkedList<>();
        boolean[] visited = new boolean[graph.nNodes()];
		int avgDegree = 0;

        nodeQueue.add(0);
        visited[0] = true;

        while (nodeQueue.isEmpty() == false) {
            int currentNode = nodeQueue.poll();
            System.out.println("Node: "+ currentNode + "     Degree: "+ graph.degree(currentNode));
			avgDegree = avgDegree + graph.degree(currentNode);

            for (int neighbor : graph.neighbours(currentNode)) {
                if (visited[neighbor] == false) {
                    nodeQueue.add(neighbor);
                    visited[neighbor] = true;
                }
            }
        }
        System.out.println("Average degree: "+avgDegree/graph.nNodes());
	}
}
