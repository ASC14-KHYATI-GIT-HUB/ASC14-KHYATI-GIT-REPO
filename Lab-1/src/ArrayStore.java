import java.util.*;

public class ArrayStore {
    private int[] arr; // instance variable
    private int size;  // actual number of elements stored

    // Constructor
    public ArrayStore() {
        arr = new int[20]; // capacity larger than 10 to allow insertions
        size = 0;
    }

    // 1. Accept 10 integers
    public void acceptNumbers(Scanner sc) {
        System.out.println("Enter 10 integers:");
        for (int i = 0; i < 10; i++) {
            arr[i] = sc.nextInt();
        }
        size = 10;
    }

    // 2a. Display elements using while loop
    public void displayWhile() {
        System.out.print("Array elements (while loop): ");
        int i = 0;
        while (i < size) {
            System.out.print(arr[i] + " ");
            i++;
        }
        System.out.println();
    }

    // 2b. Display elements using for loop
    public void displayFor() {
        System.out.print("Array elements (for loop): ");
        for (int i = 0; i < size; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

    // 3. Sort array
    public void sortArray() {
        Arrays.sort(arr, 0, size);
        System.out.println("Array sorted.");
    }

    // 4. Count occurrences of a number
    public int countOccurrences(int num) {
        int count = 0;
        for (int i = 0; i < size; i++) {
            if (arr[i] == num) {
                count++;
            }
        }
        return count;
    }

    // 5. Insert a number at a given position
    public void insertAt(int num, int pos) {
        if (pos < 0 || pos > size) {
            System.out.println("Invalid position!");
            return;
        }
        for (int i = size; i > pos; i--) {
            arr[i] = arr[i - 1]; // shift right
        }
        arr[pos] = num;
        size++;
        System.out.println("Number inserted.");
    }

    // 6. Return array excluding duplicates
    public int[] uniqueArray() {
        LinkedHashSet<Integer> set = new LinkedHashSet<>();
        for (int i = 0; i < size; i++) {
            set.add(arr[i]);
        }
        int[] uniqueArr = new int[set.size()];
        int i = 0;
        for (int val : set) {
            uniqueArr[i++] = val;
        }
        return uniqueArr;
    }

    // Main method to test
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayStore store = new ArrayStore();

        store.acceptNumbers(sc);

        store.displayWhile();
        store.displayFor();

        store.sortArray();
        store.displayFor();

        System.out.print("Enter a number to count occurrences: ");
        int num = sc.nextInt();
        System.out.println("Occurrences of " + num + ": " + store.countOccurrences(num));

        System.out.print("Enter a number and position to insert: ");
        int n = sc.nextInt();
        int pos = sc.nextInt();
        store.insertAt(n, pos);
        store.displayFor();

        System.out.println("Array without duplicates: " + Arrays.toString(store.uniqueArray()));

        sc.close();
    }
}