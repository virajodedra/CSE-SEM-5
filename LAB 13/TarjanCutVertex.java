// time complexity : O( V + E)

import java.util.*;

public class TarjanCutVertex {
    static int time = 0;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of vertices: ");
        int n = sc.nextInt();
        System.out.print("Enter number of edges: ");
        int e = sc.nextInt();

        List<List<Integer>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) graph.add(new ArrayList<>());

        System.out.println("Enter edges (u v):");
        for (int i = 0; i < e; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            graph.get(u).add(v);
            graph.get(v).add(u); // undirected
        }

        boolean[] visited = new boolean[n];
        int[] disc = new int[n];
        int[] low = new int[n];
        int[] parent = new int[n];
        Arrays.fill(parent, -1);
        boolean[] articulation = new boolean[n];

        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                dfs(i, graph, visited, disc, low, parent, articulation);
            }
        }

        System.out.println("Cut vertices:");
        for (int i = 0; i < n; i++) {
            if (articulation[i]) {
                System.out.println("Vertex " + i);
            }
        }
    }

    static void dfs(int u, List<List<Integer>> graph, boolean[] visited,
                    int[] disc, int[] low, int[] parent, boolean[] articulation) {
        visited[u] = true;
        disc[u] = low[u] = ++time;
        int children = 0;

        for (int v : graph.get(u)) {
            if (!visited[v]) {
                children++;
                parent[v] = u;
                dfs(v, graph, visited, disc, low, parent, articulation);

                // check if subtree rooted at v has a back edge
                low[u] = Math.min(low[u], low[v]);

                // root case
                if (parent[u] == -1 && children > 1) {
                    articulation[u] = true;
                }

                // non-root case
                if (parent[u] != -1 && low[v] >= disc[u]) {
                    articulation[u] = true;
                }

            } else if (v != parent[u]) {
                // update low[u] for back edge
                low[u] = Math.min(low[u], disc[v]);
            }
        }
    }
}
