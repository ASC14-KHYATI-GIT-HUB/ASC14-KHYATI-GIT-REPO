public class  InternationalMovie extends MovieTest {
    private String country;
    private String language;

    public InternationalMovie(String movieName, String producedBy, String country, String language) {
        super(movieName, producedBy);
        this.country = country;
        this.language = language;
    }

    public void displayInternationalInfo() {
        displayBasicInfo();
        System.out.println("Country: " + country);
        System.out.println("Language: " + language);
    }
}

class Main {
    public static void main(String[] args) {
        SpecialMovie sm = new SpecialMovie("Avatar", "James Cameron", "Dolby Atmos", "Weta Digital");
        sm.displaySpecialInfo();

        System.out.println();

        InternationalMovie im = new InternationalMovie("Parasite", "Kwak Sin-ae", "South Korea", "Korean");
        im.displayInternationalInfo();
    }
}
