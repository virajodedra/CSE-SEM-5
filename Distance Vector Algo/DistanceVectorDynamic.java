import java.util.*;

public class DistanceVectorDynamic{

    static final int INF = 9999; // infinity

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of routers: ");
        int n = sc.nextInt();

        int[][] costMatrix = new int[n][n];
        for (int i = 0; i < n; i++) {
            Arrays.fill(costMatrix[i], INF);
            costMatrix[i][i] = 0; // distance to itself is 0
        }

        System.out.print("Enter number of direct links: ");
        int edges = sc.nextInt();

        System.out.println("Enter each link as: <from> <to> <cost>");
        for (int i = 0; i < edges; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            int c = sc.nextInt();
            costMatrix[u][v] = c;
            costMatrix[v][u] = c; // undirected (bi-directional) link
        }

        int[][] distance = new int[n][n];
        int[][] nextHop = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                distance[i][j] = costMatrix[i][j];
                if (i == j) {
                    nextHop[i][j] = i; // itself
                } else if (costMatrix[i][j] != INF) {
                    nextHop[i][j] = j; // direct neighbor
                } else {
                    nextHop[i][j] = -1; // unknown
                }
            }
        }

        boolean updated;
        do {
            updated = false;
            for (int src = 0; src < n; src++) {
                for (int dest = 0; dest < n; dest++) {
                    for (int via = 0; via < n; via++) {
                        if (distance[src][via] + distance[via][dest] < distance[src][dest]) {
                            distance[src][dest] = distance[src][via] + distance[via][dest];
                            nextHop[src][dest] = nextHop[src][via];
                            updated = true;
                        }
                    }
                }
            }
        } while (updated);

        System.out.println("\n=== Final Distance Vector Tables ===");
        for (int i = 0; i < n; i++) {
            System.out.println("Router " + i + " Routing Table:");
            System.out.println("Destination\tNextHop\tCost");
            for (int j = 0; j < n; j++) {
                if (i == j) continue;
                String hop = (nextHop[i][j] == -1) ? "-" : String.valueOf(nextHop[i][j]);
                String cost = (distance[i][j] >= INF) ? "INF" : String.valueOf(distance[i][j]);
                System.out.println("    " + j + "\t\t   " + hop + "\t   " + cost);
            }
            System.out.println();
        }

        sc.close();
    }
}
