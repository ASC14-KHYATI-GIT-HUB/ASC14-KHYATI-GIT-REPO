public class MultiplicationTable {

    // Method using for loop
    public static void printTableFor(int n) {
        System.out.println("Multiplication Table of " + n + " using for loop:");
        for (int i = 1; i <= 10; i++) {
            System.out.println(n + " x " + i + " = " + (n * i));
        }
        System.out.println();
    }

    // Method using while loop
    public static void printTableWhile(int n) {
        System.out.println("Multiplication Table of " + n + " using while loop:");
        int i = 1;
        while (i <= 10) {
            System.out.println(n + " x " + i + " = " + (n * i));
            i++;
        }
        System.out.println();
    }

    // Method using do-while loop
    public static void printTableDoWhile(int n) {
        System.out.println("Multiplication Table of " + n + " using do-while loop:");
        int i = 1;
        do {
            System.out.println(n + " x " + i + " = " + (n * i));
            i++;
        } while (i <= 10);
        System.out.println();
    }

    // Main method to test
    public static void main(String[] args) {
        int number = 2; // you can change this to test with any number

        printTableFor(number);
        printTableWhile(number);
        printTableDoWhile(number);
    }
}