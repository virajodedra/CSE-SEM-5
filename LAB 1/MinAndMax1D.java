import java.util.Scanner;

public class MinAndMax1D {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the lengh of the array :");
        int n = sc.nextInt();

        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.err.println("Enter the elements at index :" + i);
            arr[i] = sc.nextInt();
        }

        int min = arr[0], max = arr[n];

        for (int i = 1; i < n; i++) {
            if (min > arr[i])
                min = arr[i];
            if (max < arr[i])
                max = arr[i];
        }

        System.err.println("The max element is :" + max);
        System.err.println("The min element is :" + min);

    }

}
