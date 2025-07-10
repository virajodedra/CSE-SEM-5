import java.util.*;

class TreeNode{
    int val;
    TreeNode left, right;

    TreeNode(int val){
        this.val = val;
        this.left = this.right = null;
    }
}


public class MaximumDepthOfTheTree {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the size of the Tree : ");
        int n = sc.nextInt();

        int[] arr = new int [n];
        
        for(int i = 0; i < n; i++) {
            System.out.println("Enter the " +( i + 1)+ " element");
            arr[i] = sc.nextInt();
        }

        System.out.println("Input Array is : " +Arrays.toString(arr));
        TreeNode root = treeFromArray(arr, 0);
        

        ArrayList<Integer> temp = new ArrayList<Integer>();
        int num = longestDepth(root, temp);

         System.out.println("Maximum Depth of the Tree: " + num);

        System.out.println("Leaf Nodes:");

        for(Integer leaf : temp){
            System.out.println(leaf);
        }
    }

    public static TreeNode treeFromArray(int[] arr, int i){
        TreeNode root = null;
        if(i >= arr.length || arr[i] == -1) return null;
        
            root = new TreeNode(arr[i]);
            root.left = treeFromArray(arr, ( 2 * i ) + 1);

            root.right = treeFromArray(arr, ( 2 * i ) + 2);
        

        return root;
    }

    public static int longestDepth(TreeNode root, ArrayList<Integer> temp){
        if(root == null) return 0;
       
        // if(root.left != null && root.right != null) {
        //     longestDepth(root.left);
        //     longestDepth(root.right);
        // }
        
        // if(root.left != null && root.right == null) {
        //     longestDepth(root.left);
        // }
        // if(root.right != null && root.left == null) {
        //     longestDepth(root.right);
        // }
        if(root.left == null && root.right == null){
            temp.add(root.val);
        }

        int left = longestDepth(root.left, temp);
        int right = longestDepth(root.right, temp);

        return Math.max(left, right) + 1;
        
    }
}
