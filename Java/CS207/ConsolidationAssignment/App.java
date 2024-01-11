public class App{
	public static void main(String[] args){
		DiGraphADT graph = new DiMaGraph(5);
		System.out.println(graph.nNodes());
		System.out.println(graph.nEdges());
		System.out.println(graph.addEdge(1,2));
		System.out.println(graph.nEdges());
		System.out.println(graph.isEdge(1,2));
		System.out.println(graph.isEdge(2,1));
		System.out.println(graph.successors(1));
		System.out.println(graph.successors(2));
		System.out.println(graph.predecessors(1));
		System.out.println(graph.predecessors(2));
		System.out.println(graph.outDegree(1));
		System.out.println(graph.outDegree(2));
		System.out.println(graph.inDegree(1));
		System.out.println(graph.inDegree(2));
	}
}