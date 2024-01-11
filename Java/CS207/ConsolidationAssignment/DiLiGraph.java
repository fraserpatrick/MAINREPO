import java.util.*;

public class DiLiGraph implements DiGraphADT {
	private List<Integer>[] adjacencyList;
	private int numNodes;
    private int numEdges;
	
	public DiLiGraph(int newNumNodes){
		this.numNodes = newNumNodes;
		this.numEdges = 0;
		this.adjacencyList = new LinkedList[numNodes];
		
		for (int i = 0; i < numNodes; i++) {
			adjacencyList[i] = new LinkedList<>();
        }
		
	}
	
	public int nNodes() {
        return numNodes;
    }

    public int nEdges() {
        return numEdges;
    }

    public boolean addEdge(int node1, int node2) {
        if (adjacencyList[node1].contains(node2) == false) {
            adjacencyList[node1].add(node2);
            numEdges++;
            return true;
        }

        return false;
    }

    public boolean isEdge(int node1, int node2) {
        return adjacencyList[node1].contains(node2);
    }

    public ArrayList<Integer> successors(int node) {
        ArrayList<Integer> successorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[node].contains(i)) {
                successorsList.add(i);
            }
        }

        return successorsList;
    }

    public ArrayList<Integer> predecessors(int node) {ArrayList<Integer> predecessorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[i].contains(node)) {
                predecessorsList.add(i);
            }
        }

        return predecessorsList;
    }

    public int outDegree(int node) {
        int outDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[node].contains(i)) {
                outDegree++;
            }
        }

        return outDegree;
    }

    public int inDegree(int node) {
        int inDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[i].contains(node)) {
                inDegree++;
            }
        }

        return inDegree;
    }
}