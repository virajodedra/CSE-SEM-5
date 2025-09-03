import java.util.*;

public class DistanceVectorAlgorithm {

    static final int INF = 9999; // infinity value for no connection

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of routers: ");
        int n = sc.nextInt();

        int[][] costMatrix = new int[n][n];
        System.out.println("Enter the cost matrix (use 9999 if no direct link): ");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                costMatrix[i][j] = sc.nextInt();
            }
        }

        int[][] distance = new int[n][n];   // distance[i][j] = shortest distance from i to j
        int[][] nextHop = new int[n][n];    // nextHop[i][j] = next router to go from i to j

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                distance[i][j] = costMatrix[i][j];
                if (i == j) {
                    nextHop[i][j] = i; 
                } else if (costMatrix[i][j] != INF) {
                    nextHop[i][j] = j; 
                } else {
                    nextHop[i][j] = -1; 
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
