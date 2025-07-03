import java.util.*;


class TreeNode{
    int val;
    TreeNode left, right;

    TreeNode(int val){
        this.val = val;
        left = right = null;
    }
}


class CheckMirrorOfItSelf{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the size of the array : ");
        int n = sc.nextInt();
         

        int[] arr = new int[n];

        for(int i = 0; i < n; i++){
            System.out.println("Enter the " +(i + 1)+ " Element :");
            arr[i] = sc.nextInt();
        }

        System.out.println("Input Array is : " +Arrays.toString(arr));
        TreeNode root = treeFromTheArray(arr, 0);
        inorder(root);

        System.out.println();
        if(isMirrorTree(root)){
            System.out.println("Congratulations Finally Your Tree is  Mirrored !!");
        }
        else{
            System.out.println("Better Luck Next Time !!!");
        }
        
    }
    public static boolean isMirrorTree(TreeNode root){
        if(root.left == null && root.right == null) return true;
        if(root.left == null || root.right == null) return false;

        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root.left);
        queue.add(root.right);

        while (!queue.isEmpty()) {
            TreeNode last = queue.poll();
            TreeNode first  = queue.poll();

            if(first == null || last == null) return false;
            if(last.val != first.val) return false;
            if((first.left == null && last.right != null) || (first.left != null && last.right == null)){
                return false;
            }
            if(first.left != null){
                queue.add(first.left);
                queue.add(last.right);
            }
            if((first.right == null && last.left != null) && (first.right != null && last.left == null)){
                return false;
            }

            if(first.right != null){
                queue.add(first.right);
                queue.add(last.left);
            }
        }

        return true;
    }

    public static TreeNode treeFromTheArray(int[] arr, int i){
        TreeNode root = null;

        if(i < arr.length){
            root = new TreeNode(arr[i]);

            root.left = treeFromTheArray(arr, 2 * i + 1);

            root.right = treeFromTheArray(arr, 2 * i + 2);
        }
        return root;
    }
    public static void inorder(TreeNode root) {
        if (root != null) { 
            inorder(root.left);
            System.out.print(root.val + " ");
            inorder(root.right);
        }
    }
}
