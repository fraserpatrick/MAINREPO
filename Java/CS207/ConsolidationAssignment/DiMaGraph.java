import java.util.*;

public class DiMaGraph implements DiGraphADT{
	private int numNodes;
	private ArrayList<Edge>edges;
	
	class Edge{
		int node1, node2;
	
		Edge(int node1, int node2){
			this.node1 = node1;
			this.node2 = node2;
		}
	}
	
	public DiMaGraph(int newNumNodes){
		numNodes = newNumNodes;
		edges = new ArrayList<Edge>();
	}
		
	public int nNodes(){
		return numNodes;
	}
	
	public int nEdges(){
		return edges.size();
	}
	
	boolean addEdge(int node1, int node2);
    boolean isEdge(int node1, int node2);
    int outDegree(int node);
    int inDegree(int node);
}