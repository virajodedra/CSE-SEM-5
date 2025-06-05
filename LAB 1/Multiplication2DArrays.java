import java.util.Scanner;

public class Multiplication2DArrays {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the number of rows :");
        int rows = sc.nextInt();
        System.out.print("Enter the number of columns :");
        int columns = sc.nextInt();

        int[][] arr = new int[rows][columns];
        int[][] arr1 = new int[rows][columns];
        int[][] arr2 = new int[rows][columns];

        System.out.println("Enter the elements of the first array :");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.println("Enter the " + i + " rows " + j + " element :");
                arr[i][j] = sc.nextInt();
            }
        }

        System.out.println("Enter the elements of the Second array :");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.println("Enter the " + i + " rows " + j + " element :");
                arr1[i][j] = sc.nextInt();
            }
        }

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                for (int k = 0; k < rows; k++) {
                    arr2[i][j] += arr[i][k] * arr1[k][j];
                }
            }
        }

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.print(" " + arr2[i][j] + " ");
            }
            System.out.println();
        }

    }

}
