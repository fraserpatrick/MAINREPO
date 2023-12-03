import java.util.*;

/**
 * An interface for a simple unweighted digraph, for use in CS207.
 * No node data is maintained. Nodes are numbered from 0.
 * 
 * @author I.Ross 
 */

public interface DiGraphADT
{ 
    /** the number of nodes in the graph
    @return returns the number of nodes in the graph
    */
    int nNodes();
 
    /** the number of edges in the graph
    @return returns the number of edges in the graph
    */
    int nEdges();
 
    /** Adds an edge from node1 to node2
    If the edge is already present in the graph it should not be duplicated
    and the method should return false. Otherwise the edge should be added 
    and the method should return true.
    @param node1 source node
    @param node2 destination node
    @return  returns true if the edge was not already present. Otherwise 
    returns false.
    */
    boolean addEdge(int node1, int node2);

    /** true if there is an edge from node1 to node2
    @param node1 source node
    @param node2 destination node
    @return returns true iff there is an edge from node1 to node2
    */
    boolean isEdge(int node1, int node2);

    /** The successors of a given node in the graph
    @param node a node in the graph
    @return returns an ArrayList of Integers which represent the successor 
    nodes of the given node
    */
    ArrayList<Integer> successors(int node);

    /** The predecessors of a given node in the graph
    @param node a node in the graph
    @return returns an ArrayList of Integers which represent the predecessor nodes of the given node
    */
    ArrayList<Integer> predecessors(int node);

    /** The outDegree of a node in the graph
    @param node a node in the graph
    @return returns the outDegree of the given node
    */
    int outDegree(int node);

    /** The inDegree of a node in the graph
    @param node a node in the graph
    @return returns the inDegree of the given node
    */
    int inDegree(int node);
}

