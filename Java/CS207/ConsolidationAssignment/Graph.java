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
        if (node1 < 0 || node1 >= numNodes || node2 < 0 || node2 >= numNodes) {
            throw new IllegalArgumentException("Invalid node indices");
        }

        if (adjacencyMatrix[node1][node2] == false && adjacencyMatrix[node2][node1] == false) {
            adjacencyMatrix[node1][node2] = true;
			adjacencyMatrix[node2][node1] = true;
            numEdges++;
            return true;
        }

        return false;
    }

    public boolean isEdge(int node1, int node2) {
        if (node1 < 0 || node1 >= numNodes || node2 < 0 || node2 >= numNodes) {
            throw new IllegalArgumentException("Invalid node indices");
        }

        return adjacencyMatrix[node1][node2] == true;
    }
	
	public ArrayList<Integer> neighbours(int node){
		if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }
		
		ArrayList<Integer> neighboursList = new ArrayList<>();
		for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                neighboursList.add(i);
            }
        }
		
		return neighboursList;
	}
	
	public int degree(int node){
		if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }
		int Degree = 0;
		for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                Degree++;
            }
        }
		
		return Degree;
	}
}
