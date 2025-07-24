import java.util.*;

public class convertGraphToMatrix {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the number of vertices: ");
        int vertices = sc.nextInt();
        System.out.print("Enter the number of edges: ");
        int edges = sc.nextInt();
        int[][] edge = new int[edges][2];
        int[][] graph = new int[vertices][vertices];

        for (int i = 0; i < edges; i++) {
            System.out.print("Enter the vertices of edge " + (i + 1) + ": ");
            int u = sc.nextInt();
            int v = sc.nextInt();
            edge[i][0] = u - 1;
            edge[i][1] = v - 1;

        }

        for (int i = 1; i < vertices; i++) {
            graph[edge[i - 1][0]][edge[i - 1][1]] = 1;
            graph[edge[i - 1][1]][edge[i - 1][0]] = 1;
        }

        for (int[] arr : graph) {
            for (int i : arr) {
                System.out.print(i + " ");
            }
            System.out.println();
        }

        boolean[] visited = new boolean[vertices];
        dfs(graph, visited, 0); // Start DFS from node 0

        boolean isConnected = true;
        for (boolean v : visited) {
            if (!v) {
                isConnected = false;
                break;
            }
        }

        if (isConnected) {
            System.out.println("The graph is CONNECTED.");
        } else {
            System.out.println("The graph is DISCONNECTED.");
        }

    }

    // DFS Function
    public static void dfs(int[][] graph, boolean[] visited, int node) {
        visited[node] = true;
        for (int i = 0; i < graph.length; i++) {
            if (graph[node][i] == 1 && !visited[i]) {
                dfs(graph, visited, i);
            }
        }
    }

}
