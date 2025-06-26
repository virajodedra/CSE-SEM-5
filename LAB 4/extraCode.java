import java.util.*;
public class extraCode {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // o for blank and 1 for the chair 
        System.out.println("Enter the length of the array :");
        int n = sc.nextInt();
        System.out.println("Enter the width of the array :");
        int m = sc.nextInt();
        int students = 0;

        int[][] arr = new int[n][m];
        boolean[][] visited = new boolean[n][m];
        System.out.println("Enter the elements of the array :");
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) {
                System.out.print("Element at position [" + i + "][" + j + "]: ");
                arr[i][j] = sc.nextInt();
            }
        }

        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) {
                if(arr[i][j] == 0){
                    continue;
                }
                else if(i - 1 >= 0 && j - 1 >= 0 && j + 1 < m && visited[i][j + 1] != true &&  visited[i][j - 1] != true && visited[i - 1][j - 1] != true && visited[i - 1][j + 1] != true){
                    students += 1;
                    visited[i][j] = true;
                }
            }
        }
        System.out.println("The number of students fit in the class is : " + students);
        
    }
    
}
