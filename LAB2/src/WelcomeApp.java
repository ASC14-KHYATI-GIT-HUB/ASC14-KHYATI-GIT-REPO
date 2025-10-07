public class WelcomeApp {

    // Method that returns a welcome message
    public static String welcomeMessage(String name) {
        return "Hello " + name + ", Welcome to Java World!";
    }

    public static void main(String[] args) {

        String userName = "Arun";

        String message = welcomeMessage(userName);

        System.out.println(message);
    }
}
