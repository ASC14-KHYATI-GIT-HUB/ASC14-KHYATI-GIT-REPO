public class Bulb {

    // Method 1: Add two integers
    public void add(int a, int b) {
        System.out.println("add(int, int): " + (a + b));
    }

    // Method 2: Add three integers
    public void add(int a, int b, int c) {
        System.out.println("add(int, int, int): " + (a + b + c));
    }

    // Method 3: Add two doubles
    public void add(double a, double b) {
        System.out.println("add(double, double): " + (a + b));
    }

    // Method 4: Concatenate a String and an integer
    public void add(String a, int b) {
        System.out.println("add(String, int): " + a + " " + b);
    }

    // Method 5: Add two shorts
    public void add(short a, short b) {
        System.out.println("add(short, short): " + (a + b));
    }

    // Main method to test all overloaded methods
    public static void main(String[] args) {
        Bulb bulb = new Bulb();

        bulb.add(10, 20);                  // Output: 30
        bulb.add(10, 20, 30);              // Output: 60
        bulb.add(10.5, 20.1);              // Output: 30.6
        bulb.add("Hello", 20);             // Output: Hello 20
        bulb.add((short)5, (short)6);      // Output: 11
    }
}

