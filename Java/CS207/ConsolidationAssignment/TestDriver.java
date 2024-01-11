// only edit the line indicated 
import java.util.*;
import java.io.*;
/**
 * to test implementations of DiGraphADT
 * copy this file to your Graph project
 * and edit line marked within TestDriver
 * constructor
 */
public class TestDriver
{
    // instance variables - do not alter
    private DiGraphADT g;
    private int n;
    
    public TestDriver()
    {
        n = 5;
//the line below is the one to edit to create an instance
//of the appropriate implementation of the DiGraphADT
        g = new DiLiGraph(n);
    }

   public void tests() {
        boolean added;
        System.out.println("Graph has "+g.nNodes()+
        " nodes and " + g.nEdges()+" edges");
        added = g.addEdge(3,0);
        if (added)
            System.out.println("Edge 3,0 added successfully");
        else
            System.out.println("Edge 3,0 not added successfully");
        added = g.addEdge(3,0);
        if (added)
            System.out.println("Edge 3,0 added again");
        else
            System.out.println("Edge 3,0 not added again");
        added = g.addEdge(1,4);
        added = g.addEdge(2,4);
        added = g.addEdge(4,3);
        added = g.addEdge(4,1);
        added = g.addEdge(0,4);
        System.out.println("Graph has "+g.nEdges()+" edges");
        if (g.isEdge(4,3))
            System.out.println("Edge 4,3 is present");
        else
            System.out.println("Edge 4,3 is not present");
        if (g.isEdge(3,4))
            System.out.println("Edge 3,4 is present");
        else
            System.out.println("Edge 3,4 is not present");
        System.out.println("The outdegree of node 4 is "
        + g.outDegree(4));
        System.out.println("The successors of node 4 are "
        + g.successors(4));
        System.out.println("The indegree of node 4 is "
        + g.inDegree(4));
        System.out.println("The predecessors of node 4 are "
        + g.predecessors(4));
    }
    
    public static void main(String[] args)
    {
        TestDriver d = new TestDriver();
        d.tests();
    }
}
