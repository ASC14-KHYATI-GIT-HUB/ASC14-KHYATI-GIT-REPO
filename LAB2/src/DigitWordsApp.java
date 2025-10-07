public class DigitWordsApp {

    public static void printDigitsInWords(int number) {

        String[] words = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};

        String numStr = String.valueOf(number);

        for (char digit : numStr.toCharArray()) {

            System.out.print(words[digit - '0'] + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        int input = 951;
        System.out.print("Digits in words: ");
        printDigitsInWords(input);
    }
}
