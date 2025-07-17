import java.util.*;

public class KrushalsAlgo {
    static int[] parent = {0, 1, 2, 3};


    private static int findParent(int i){
        return parent[i];
    }
    private static void union(int u, int v){
        parent[u] = parent[v];
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // int n;
        // System.out.println("Enter the number of vertices : ");
        // n = sc.nextInt();
        // ArrayList<int[]> arrayList = new ArrayList<>();

        // int choice = 0;
        // while (choice != 1) {
        //     System.out.println("Enter the starting vertex, ending vertex and their path weight accordingly");
        //     int start = 0;
        //     int end = 0;
        //     int weight = 0;
        //     start = sc.nextInt();
        // }

        int[][] edges = {
            {0, 1, 10},
            {0, 2, 6},
            {0, 3, 5},
            {1, 3, 15},
            {2, 3, 4},
        };

        Arrays.sort(edges, (a, b) -> a[2] - b[2]);
        System.out.println(Arrays.deepToString(edges));

        Set<Integer> set = new HashSet<>();

        int i = 0;
        int weight = 0;

        while (set.size() != parent.length && i < edges.length) {
            int[] edge = edges[i];
            if(parent[edge[0]] != parent[edge[1]]){
                System.out.println(edge[0] + " -> " + edge[1] + " weight : " + edge[2] + " ");
                union(parent[edge[0]] , parent[edge[1]]);
                weight += edge[2];
                set.add(edge[0]);
                set.add(edge[1]);
            }
            i += 1;

        }

        System.out.println("The minimum total weight of the tree is : " + weight);
    }
}
