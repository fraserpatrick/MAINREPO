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
        if (node1 < 0 || node1 >= numNodes || node2 < 0 || node2 >= numNodes) {
            throw new IllegalArgumentException("Invalid node indices");
        }

        if (adjacencyList[node1].contains(node2) == false) {
            adjacencyList[node1].add(node2);
            numEdges++;
            return true;
        }

        return false;
    }

    public boolean isEdge(int node1, int node2) {
        if (node1 < 0 || node1 >= numNodes || node2 < 0 || node2 >= numNodes) {
            throw new IllegalArgumentException("Invalid node indices");
        }

        return adjacencyList[node1].contains(node2);
    }

    public ArrayList<Integer> successors(int node) {
        if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }

        ArrayList<Integer> successorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[node].contains(i)) {
                successorsList.add(i);
            }
        }

        return successorsList;
    }

    public ArrayList<Integer> predecessors(int node) {
        if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }

        ArrayList<Integer> predecessorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[i].contains(node)) {
                predecessorsList.add(i);
            }
        }

        return predecessorsList;
    }

    public int outDegree(int node) {
        if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }

        int outDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[node].contains(i)) {
                outDegree++;
            }
        }

        return outDegree;
    }

    public int inDegree(int node) {
        if (node < 0 || node >= numNodes) {
            throw new IllegalArgumentException("Invalid node index");
        }

        int inDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyList[i].contains(node)) {
                inDegree++;
            }
        }

        return inDegree;
    }
}