public class StringMethodsDemo {

    public static void testCharAt(String str) {
        System.out.println("charAt(2): " + str.charAt(2));
    }


    public static void testContains(String str, String sub) {
        System.out.println("Contains \"" + sub + "\": " + str.contains(sub));
    }

    public static void testLength(String str) {
        System.out.println("Length: " + str.length());
    }

    public static void testIndexOf(String str, String sub) {
        System.out.println("IndexOf \"" + sub + "\": " + str.indexOf(sub));
    }

    public static void testEquals(String str1, String str2) {
        System.out.println("Equals: " + str1.equals(str2));
    }

    public static void testEqualsIgnoreCase(String str1, String str2) {
        System.out.println("EqualsIgnoreCase: " + str1.equalsIgnoreCase(str2));
    }

    public static void testJoin() {
        String joined = String.join("-", "Java", "Python", "C++");
        System.out.println("Joined String: " + joined);
    }
    public static void testLastIndexOf(String str, String sub) {
        System.out.println("LastIndexOf \"" + sub + "\": " + str.lastIndexOf(sub));
    }
    public static void testSubstring(String str) {
        System.out.println("Substring(2, 6): " + str.substring(2, 6));
    }

    public static void testToLowerCase(String str) {
        System.out.println("ToLowerCase: " + str.toLowerCase());
    }

    public static void testToUpperCase(String str) {
        System.out.println("ToUpperCase: " + str.toUpperCase());
    }


    public static void testTrim(String str) {
        System.out.println("Trimmed: \"" + str.trim() + "\"");
    }


    public static void main(String[] args) {
        String sample = "  Hello World  ";
        String another = "hello world";

        System.out.println("Original: \"" + sample + "\"\n");

        testCharAt(sample);
        testContains(sample, "World");
        testLength(sample);
        testIndexOf(sample, "World");
        testEquals(sample.trim(), another);
        testEqualsIgnoreCase(sample.trim(), another);
        testJoin();
        testLastIndexOf(sample, "l");
        testSubstring(sample);
        testToLowerCase(sample);
        testToUpperCase(sample);
        testTrim(sample);
    }
}