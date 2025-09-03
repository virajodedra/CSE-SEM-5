import java.util.*;

public class DistanceVectorAlgo{

    static final int INF = 9999; 

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of routers: ");
        int n = sc.nextInt();

        int[][] costMatrix = new int[n][n];
        for (int i = 0; i < n; i++) {
            Arrays.fill(costMatrix[i], INF);
            costMatrix[i][i] = 0; 
        }

        System.out.print("Enter number of direct links: ");
        int edges = sc.nextInt();

        System.out.println("Enter each link as: <from> <to> <cost>");
        for (int i = 0; i < edges; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            int c = sc.nextInt();
            costMatrix[u][v] = c;
            costMatrix[v][u] = c;
        }

        int[][] distance = new int[n][n];
        int[][] nextHop = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                distance[i][j] = costMatrix[i][j];
                if (i == j) nextHop[i][j] = i;
                else if (costMatrix[i][j] != INF) nextHop[i][j] = j;
                else nextHop[i][j] = -1;
            }
        }

        boolean updated;
        int round = 1;
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

            System.out.println("\n=== ROUND " + round + " ===");
            printRoutingTables(distance, nextHop, n);

            round++;

        } while (updated);

        sc.close();
    }

    static void printRoutingTables(int[][] distance, int[][] nextHop, int n) {
        for (int i = 0; i < n; i++) {
            System.out.println("Router " + i + " Table:");
            System.out.println("Destination\tNextHop\tCost");
            for (int j = 0; j < n; j++) {
                if (i == j) continue;
                String hop = (nextHop[i][j] == -1) ? "-" : String.valueOf(nextHop[i][j]);
                String cost = (distance[i][j] >= INF) ? "INF" : String.valueOf(distance[i][j]);
                System.out.println("    " + j + "\t\t   " + hop + "\t   " + cost);
            }
            System.out.println();
        }
    }
}
