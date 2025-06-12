import java.util.*;
public class BreadthFirstSearch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of the vertices : ");
        int n = sc.nextInt();

        ArrayList<ArrayList<Integer>> adjeArrayList = new ArrayList<>();

        for(int i = 0; i < n; i++){
            adjeArrayList.add(new ArrayList<>());
            System.out.println("For vertex : " +i+ " Enter the  edge :");
            int j = 0;
            System.out.println("Enter the vertex " +j+ "and press -1 to quit :");
            int ver = sc.nextInt();

            while(ver >= 0){
                adjeArrayList.get(i).add(ver);
                j++;
                System.out.println("Enter the vertex " +j+ " -1 to quit :");
                ver = sc.nextInt();
            }
        }

        System.out.println(adjeArrayList);
        Queue<Integer> queue = new LinkedList<>();
        boolean[] visited = new boolean[n];
        ArrayList<Integer> res = new ArrayList<>();

        queue.add(0);
        visited[0] = true;
        while (!queue.isEmpty()) {
            int node = queue.poll();
            res.add(node);
            
            for(int i = 0; i < adjeArrayList.get(node).size(); i++){
                int temp = adjeArrayList.get(node).get(i);
                if(!visited[temp]){
                    queue.add(temp);
                    visited[temp] = true;
                }
            }
        }

        System.out.println("The Result of the BFS Search is :");
        System.out.println(res);
    }
}
