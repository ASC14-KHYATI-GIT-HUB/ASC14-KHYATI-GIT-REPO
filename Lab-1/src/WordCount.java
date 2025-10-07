public class WordCount {

    public static int countWords(String input) {

        String[] parts = input.trim().split("\\s+");
        int count = 0;

        for (String word : parts) {
            if (word.matches("[a-zA-Z]+")) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        String text = "Sum of 12 and 20 is 32";
        int result = countWords(text);

        System.out.println("Input: " + text);
        System.out.println("Word Count: " + result);
    }
}
