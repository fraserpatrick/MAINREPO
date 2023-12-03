import java.util.*;
/**
 * DiGraphEdgeList provides an implementation of a digraph using 
 * an edge list
 * 
 * @author I.Ross 
 */
public class DiGraphEdgeList implements DiGraphADT
{

    // instance variable
    private ArrayList<Edge>edges;  // edge list
    private int numNodes;  // number of nodes
    
    //internal class
    class Edge {
        int node1, node2;
        
        Edge(int node1, int node2){
          this.node1 = node1;
          this.node2 = node2;
        }
    }    
    
    /**
    * Constructor for objects of class GraphEdgeList
    * @param n number of nodes in the graph
    */
    public DiGraphEdgeList(int n)
    {
        // initialise instance variables
        edges = new ArrayList<Edge>();
        numNodes = n;
    }
    
    /** the number of nodes in the graph
    @return returns the number of nodes in the graph
    */
    public int nNodes()
    {
        return numNodes;
    }
 
    /** the number of edges in the graph
    @return returns the number of edges in the graph
    */
    public int nEdges()
    {
        return edges.size();
    }
    
    /** Adds an edge from node1 to node2
    If the edge is already present in the graph it should not be duplicated
    and the method should return false. Otherwise the edge should be added 
    and the method should return true.
    @param node1 source node
    @param node2 destination node
    @return  returns true if the edge was not previously present. Otherwise returns false.
    */
    public boolean addEdge(int node1, int node2) 
    {
        if (isEdge(node1,node2))
          return false;
        Edge edge = new Edge(node1,node2);
        edges.add(edge);
        return true;
    }

    /** true if there is an edge from node1 to node2
    @param node1 source node
    @param node2 destination node
    @return returns true iff there is an edge from node1 to node2
    */
    public boolean isEdge(int node1, int node2) 
    {
        int i=0; 
        boolean found = false;
        while (!found && i<nEdges())
        {
          if ((edges.get(i).node1 == node1) && (edges.get(i).node2 == node2))
             found = true;
          else
             i++;
        }
        return found;
    }

    /** The successors of a given node in the graph
    @param node a node in the graph
    @return returns an ArrayList of Integers which represent the successor nodes of the given node
    */
    public ArrayList<Integer> successors(int node) 
    {
        ArrayList<Integer> successorNodes = new ArrayList<Integer>();
        for (int i=0; i<nEdges(); i++)
           if (edges.get(i).node1 == node)
             successorNodes.add(edges.get(i).node2);
        return successorNodes;
    };

    /** The predecssors of a given node in the graph
    @param node a node in the graph
    @return returns an ArrayList of Integers which represent the predecessor nodes of the given node
    */
    public ArrayList<Integer> predecessors(int node) 
    {
        ArrayList<Integer> predecessorNodes = new ArrayList<Integer>();
        for (int i=0; i<nEdges(); i++)
           if (edges.get(i).node2 == node)
             predecessorNodes.add(edges.get(i).node1);
        return predecessorNodes;
    };

    /** The outDegree of a node in the graph
    @param node a node in the graph
    @return returns the outDegree of the given node
    */
    public int outDegree(int node)
    {
       return successors(node).size();
    }

    /** The inDegree of a node in the graph
    @param node a node in the graph
    @return returns the inDegree of the given node
    */
    public int inDegree(int node)
    {
        return predecessors(node).size();
    }
}

