public class LargestNumberApp {

    // Method to find the largest of three numbers
    public static int largest(int a, int b, int c) {
        return Math.max(a, Math.max(b, c));
    }

    // Main method to test the largest method
    public static void main(String[] args) {
        int num1 = 45;
        int num2 = 78;
        int num3 = 32;
        
        int result = largest(num1, num2, num3);


        System.out.println("The largest number is: " + result);
    }
}
