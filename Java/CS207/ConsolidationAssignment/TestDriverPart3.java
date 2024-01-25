// only edit the line indicated 
import java.util.*;
import java.io.*;
/**
 * to test implementations of GraphADT
 * copy this file to your Graph project
 * and edit line marked within TestDriver3
 * constructor
 */
public class TestDriverPart3
{
    // instance variables - do not alter
    private GraphADT g;
    private int n;
    
    public TestDriverPart3()
    {
        n = 7;
//the line below is the one to edit to create an instance
//of your implementation of the GraphADT
        g = new Graph(n);
    }

   public void tests() {
        boolean added;
        System.out.println("Graph has "+g.nNodes()+
        " nodes and " + g.nEdges()+" edges");
        added = g.addEdge(4,0);
        if (added)
            System.out.println("Edge between 4 and 0 added successfully");
        else
            System.out.println("Edge between 4 and 0 not added successfully");
        added = g.addEdge(0,4);
        if (added)
            System.out.println("Edge between 4 and 0 added again");
        else
            System.out.println("Edge between 4 and 0 not added again");
        added = g.addEdge(1,4);
        added = g.addEdge(2,6);
        added = g.addEdge(4,3);
        added = g.addEdge(5,1);
        added = g.addEdge(0,5);
        System.out.println("Graph has "+g.nEdges()+" edges");
        if (g.isEdge(4,3))
            System.out.println("Edge between 4 and 3 is present");
        else
            System.out.println("Edge between 4 and 3 is not present");
        if (g.isEdge(3,4))
            System.out.println("Edge between 3 and 4 is present");
        else
            System.out.println("Edge between 3 and 4 is not present");
        System.out.println("The degree of node 4 is "
        + g.degree(4));
        System.out.println("The neighbours of node 4 are "
        + g.neighbours(4));
        System.out.println("The degree of node 6 is "
        + g.degree(6));
        System.out.println("The neighbours of node 6 are "
        + g.neighbours(6));
    }
    
    public static void main(String[] args)
    {
        TestDriverPart3 d = new TestDriverPart3();
        d.tests();
    }
}
