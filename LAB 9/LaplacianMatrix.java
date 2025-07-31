import java.util.*;
public class LaplacianMatrix{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of vertices :");
        int n = sc.nextInt();

        System.out.println("Enter the number of edges : ");
        int e  = sc.nextInt();

        int[][] matrix = new int[e][2];
        for(int i = 0; i < e; i++) {
            System.out.println("Enter the edge set of the " + (i));
            System.out.println("Enter the first vertex :");
            matrix[i][0] = sc.nextInt() - 1;    //because index starts from the zero
            System.out.println("Enter the second vertex :");
            matrix[i][1] = sc.nextInt() - 1;
        }

        int[] degree = new int[n];
        
        for(int[] row : matrix){
            degree[row[0]]++;
            degree[row[1]]++;

        }
        int[][] degree1 = new int[n][n];
        for(int i = 0; i < n; i++){
            degree1[i][i] = degree[i];
        }
        System.out.println(Arrays.toString(degree));

        int[][] adjMatrix = new int[n][n];
        
        for(int row[] : matrix) {
            adjMatrix[row[0]][row[1]] = 1;
            adjMatrix[row[1]][row[0]] = 1;
        }

        int[][] laplaMatrix = new int[n][n];
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < n; j++) {
                laplaMatrix[i][j] = degree1[i][j] - adjMatrix[i][j];
            }
        }

        System.out.println("\n Laplacian Matrix:");
        for (int[] row : laplaMatrix) {
            System.out.println(Arrays.toString(row));
        }
        
    }
}