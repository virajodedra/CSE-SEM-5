import java.util.*;

public class HallsTheorem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Enter the number of the vertices of another part of the biparted graph: ");
        int v1 = sc.nextInt();
        System.out.println(" Enter the number of the vertices of another part of the biparted graph : ");
        int v2 = sc.nextInt();

        int[][] graph = new int[v1][v2];
        System.out.println( " Enter the values of the array :  ");
        System.out.println(" Instruction : give 1 if there exist any relationship ... ");
        for( int i = 0; i < v1; i++ ) {
            for( int j = 0; j < v2; j++ ) {
                System.out.println(" Enter the value at the " + (i + 1) + " and  " + (j + 1)  );
                graph[i][j] = sc.nextInt();
            }
        }

        /*
            x1 -> { y1, y2 }
            x2->  { y1, y3 }
            x3 -> { y3 }
        */

        
        for( int i = 0; i < v1; i++ ) {
            int neighbors = 0;
            for( int j = 0; j < v2; j++ ) {
                if( graph[i][j] == 1 ){
                    neighbors += 1;
                }
            }
            if(neighbors == 0) {
                System.out.println(" here the neighbors are zero halls theorem not possible no perfect matching found !! ");
                return;
            }
        }


        int[] visited = new int[v2];
        int totalNeighbors = 0;
        for( int i = 0; i < v1; i++ ) {
            for( int j = 0; j < v2; j++ ) {
                if( graph[i][j] == 1 && visited[j] == 0) {
                    visited[j] += 1;
                    totalNeighbors += 1;
                }
            }
        }

        if( totalNeighbors < v1 ) {
            System.out.println(" Not enough total neighbors → Hall's condition failed...  Perfect Matching not Found ! ");
        }
        else{
            System.out.println("Hall's condition satisfied ...  Perfect Matching  Found !!! ");

        }
    }    
}
