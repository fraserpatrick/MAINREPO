import java.util.*;

public class Graph implements GraphADT {

    private boolean[][] adjacencyMatrix;
    private int numNodes;
    private int numEdges;

    public Graph(int newNumNodes) {
        this.numNodes = newNumNodes;
        this.numEdges = 0;
        this.adjacencyMatrix = new boolean[numNodes][numNodes];
    }

    public int nNodes() {
        return numNodes;
    }

    public int nEdges() {
        return numEdges;
    }

    public boolean addEdge(int node1, int node2) {
        if (adjacencyMatrix[node1][node2] == false && adjacencyMatrix[node2][node1] == false) {
            adjacencyMatrix[node1][node2] = true;
			adjacencyMatrix[node2][node1] = true;
            numEdges++;
            return true;
        }

        return false;
    }

    public boolean isEdge(int node1, int node2) {
        return adjacencyMatrix[node1][node2] == true;
    }
	
	public ArrayList<Integer> neighbours(int node){
		ArrayList<Integer> neighboursList = new ArrayList<>();
		for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                neighboursList.add(i);
            }
        }
		
		return neighboursList;
	}
	
	public int degree(int node){
		int Degree = 0;
		for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                Degree++;
            }
        }
		
		return Degree;
	}
}
