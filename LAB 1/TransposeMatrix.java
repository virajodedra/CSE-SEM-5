import java.util.*;
class TransposeMatrix {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of Column of the matrix:");
        int col = sc.nextInt();
        System.out.println("Enter the number of Row of the matrix:");
        int row = sc.nextInt();
        int[][] matrix = new int[row][col];

        // System.out.println("Enter the number of Column of the matrix:");
        // int col1 = sc.nextInt();
        // System.out.println("Enter the number of Row of the matrix:");
        // int row2 = sc.nextInt();
        // int[][] matrix1 = new int[row2][col1];

        for(int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                System.out.println("Enter the element at position [" + i + "][" + j + "]:");
                matrix[i][j] = sc.nextInt();
            }
        }
        System.out.println("The original matrix is:");
        for(int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }

        int[][] transposedMatrix = new int[col][row];
        for(int i = 0; i < col; i++) {
            for (int j = 0; j < row; j++) {
                if (i < j) {
                    int temp = matrix[i][j];
                    transposedMatrix[i][j] = matrix[j][i];
                    transposedMatrix[j][i] = temp;
                }
                else {
                    transposedMatrix[i][j] = matrix[j][i];
                }
            }
        }
        System.out.println("The transposed matrix is:");
        for(int i = 0; i < col; i++) {
            for (int j = 0; j < row; j++) {
                System.out.print(transposedMatrix[i][j] + " ");
            }
            System.out.println();
        }

    }
}
