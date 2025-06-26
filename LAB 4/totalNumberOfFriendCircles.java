import java.util.*;
class totalNumberOfFriendCircles{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the length of the array :");
        int n = sc.nextInt();
        System.out.println("Enter the width of the array :");
        int m = sc.nextInt();
        int friendCircles = 0;

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
                if(arr[i][j] == 1 && !visited[i][j]) {
                    dfs(arr, i, j, n, m, visited);
                    friendCircles++;
                } 
            }
        }
        System.out.println("The total number of groups are : " + friendCircles);
    }

    public static void dfs(int[][] arr ,int i, int j, int m, int n, boolean[][] visited) {
        if(i < 0 || i >= m || j < 0 || j >= n || arr[i][j] == 0 || visited[i][j]) {
            return;
        }
        visited[i][j] = true;

        dfs(arr, i + 1, j, m, n, visited);
        dfs(arr, i, j + 1, m, n, visited);
        dfs(arr, i - 1, j, m, n, visited);
        dfs(arr, i , j - 1, m, n, visited);
    }
}