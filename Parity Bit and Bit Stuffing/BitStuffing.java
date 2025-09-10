import java.util.*;

public class BitStuffing {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter binary data: ");
        String data = sc.next();

        StringBuilder stuffed = new StringBuilder();
        int count = 0;
        for (char bit : data.toCharArray()) {
            stuffed.append(bit);
            if (bit == '1') {
                count++;
                if (count == 5) {
                    stuffed.append('0');
                    count = 0;
                }
            } else count = 0;
        }

        System.out.println("Stuffed Data: " + stuffed);
        // sc.close();
    }
}
