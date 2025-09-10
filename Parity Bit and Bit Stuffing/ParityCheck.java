import java.util.Scanner;

public class ParityCheck {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter binary data: ");
        String data = sc.next();

        int count = 0;
        for (char bit : data.toCharArray()) {
            if (bit == '1') count++;
        }

        System.out.print("Choose parity (even/odd): ");
        String choice = sc.next().toLowerCase();

        String parityBit;
        if (choice.equals("even")) {
            parityBit = (count % 2 == 0) ? "0" : "1";
        } else {
            parityBit = (count % 2 == 0) ? "1" : "0";
        }

        String transmitted = data + parityBit;
        System.out.println("Transmitted Data: " + transmitted);

        System.out.print("Enter received data: ");
        String received = sc.next();

        int receivedCount = 0;
        for (char bit : received.toCharArray()) {
            if (bit == '1') receivedCount++;
        }

        boolean valid;
        if (choice.equals("even")) valid = (receivedCount % 2 == 0);
        else valid = (receivedCount % 2 != 0);

        if (valid) System.out.println("No Error (Data is valid)");
        else System.out.println("Error Detected (Data corrupted)");

        sc.close();
    }
}
