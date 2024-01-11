import java.util.*;

public class DiMaGraph implements DiGraphADT {

    private boolean[][] adjacencyMatrix;
    private int numNodes;
    private int numEdges;

    public DiMaGraph(int newNumNodes) {
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
        if (adjacencyMatrix[node1][node2] == false) {
            adjacencyMatrix[node1][node2] = true;
            numEdges++;
            return true;
        }

        return false;
    }

    public boolean isEdge(int node1, int node2) {
        return adjacencyMatrix[node1][node2] == true;
    }

    public ArrayList<Integer> successors(int node) {
        ArrayList<Integer> successorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                successorsList.add(i);
            }
        }

        return successorsList;
    }

    public ArrayList<Integer> predecessors(int node) {
        ArrayList<Integer> predecessorsList = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[i][node] == true) {
                predecessorsList.add(i);
            }
        }

        return predecessorsList;
    }

    public int outDegree(int node) {
        int outDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[node][i] == true) {
                outDegree++;
            }
        }

        return outDegree;
    }

    public int inDegree(int node) {
        int inDegree = 0;
        for (int i = 0; i < numNodes; i++) {
            if (adjacencyMatrix[i][node] == true) {
                inDegree++;
            }
        }

        return inDegree;
    }
}
