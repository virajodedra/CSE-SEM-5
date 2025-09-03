//static

import java.util.*;
public class Dijkstra{
    static final int V = 5; 
    static final int INF = Integer.MAX_VALUE;


    static int findKey(boolean[] visited, int[] distance) {
        int min = INF;
        int key = -1;

        for (int i = 0; i < V; i++) {
            if (!visited[i] && distance[i] < min) {
                min = distance[i];
                key = i;
            }
        }
        return key;
    }

    // Dijkstra’s algorithm
    static void dijkstra(int[][] graph) {
        boolean[] visited = new boolean[V];
        int[] distance = new int[V];
        Arrays.fill(distance, INF);

        distance[0] = 0; 

        for (int i = 0; i < V - 1; i++) {
            int u = findKey(visited, distance);
            if (u == -1) break; 

            visited[u] = true;

            for (int v = 0; v < V; v++) {
                if (graph[u][v] != 0 && !visited[v] && distance[u] != INF
                        && distance[v] > distance[u] + graph[u][v]) {
                    distance[v] = distance[u] + graph[u][v];
                }
            }
        }

        System.out.println("\nShortest distances from node 0:");
        for (int i = 0; i < V; i++) {
            if (distance[i] == INF)
                System.out.println("Node " + i + ": INF");
            else
                System.out.println("Node " + i + ": " + distance[i]);
        }
    }

    public static void main(String[] args) {
        int[][] graph = {
            {0, 9, 75, 0, 0},
            {0, 0, 95, 0, 42},
            {0, 0, 0, 51, 0},
            {0, 19, 0, 0, 0},
            {0, 0, 0, 0, 31}
        };

        System.out.println("Graph:");
        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                System.out.print(graph[i][j] + "\t");
            }
            System.out.println();
        }

        dijkstra(graph);
    }
}


//dynamic code :

import java.util.*;

public class Dijkstra {

    static final int INF = Integer.MAX_VALUE;

    static int findKey(boolean[] visited, int[] distance, int V) {
        int min = INF;
        int key = -1;

        for (int i = 0; i < V; i++) {
            if (!visited[i] && distance[i] < min) {
                min = distance[i];
                key = i;
            }
        }
        return key;
    }

    static void dijkstra(int[][] graph, int src) {
        int V = graph.length;  
        boolean[] visited = new boolean[V];
        int[] distance = new int[V];
        Arrays.fill(distance, INF);

        distance[src] = 0; 

        for (int i = 0; i < V - 1; i++) {
            int u = findKey(visited, distance, V);
            if (u == -1) break; 

            visited[u] = true;

            for (int v = 0; v < V; v++) {
                if (graph[u][v] != 0 && !visited[v] && distance[u] != INF
                        && distance[v] > distance[u] + graph[u][v]) {
                    distance[v] = distance[u] + graph[u][v];
                }
            }
        }

        System.out.println("\nShortest distances from node " + src + ":");
        for (int i = 0; i < V; i++) {
            if (distance[i] == INF)
                System.out.println("Node " + i + ": INF");
            else
                System.out.println("Node " + i + ": " + distance[i]);
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of vertices: ");
        int V = sc.nextInt();

        int[][] graph = new int[V][V];
        System.out.println("Enter adjacency matrix (0 if no edge):");
        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                graph[i][j] = sc.nextInt();
            }
        }

        System.out.print("Enter source node (0 to " + (V - 1) + "): ");
        int src = sc.nextInt();

        System.out.println("\nGraph:");
        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                System.out.print(graph[i][j] + "\t");
            }
            System.out.println();
        }

        dijkstra(graph, src);

        sc.close();
    }
}

