public class Movie {
    // Attributes
    private String movieName;
    private String producedBy;
    private String directedBy;
    private int duration;
    private int year;
    private String category;

    // Constructor with mandatory fields
    public Movie(String movieName, String producedBy) {
        this.movieName = movieName;
        this.producedBy = producedBy;
    }

    // Constructor with all attributes, calling the mandatory constructor using this()
    public Movie(String movieName, String producedBy, String directedBy, int duration, int year, String category) {
        this(movieName, producedBy); // calls the mandatory constructor
        this.directedBy = directedBy;
        this.duration = duration;
        this.year = year;
        this.category = category;
    }

    // Method to accept information (setter methods)
    public void setDirectedBy(String directedBy) {
        this.directedBy = directedBy;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // Method to display information
    public void displayInfo() {
        System.out.println("Movie Name: " + movieName);
        System.out.println("Produced By: " + producedBy);
        System.out.println("Directed By: " + directedBy);
        System.out.println("Duration: " + duration + " minutes");
        System.out.println("Year: " + year);
        System.out.println("Category: " + category);
    }

    // Main method to test the class
    public static void main(String[] args) {



        Movie m2 = new Movie("Inception", "Emma Thomas");
        m2.setDirectedBy("Christopher Nolan");
        m2.setDuration(148);
        m2.setYear(2010);
        m2.setCategory("SciFi");
        m2.displayInfo();

        // Creating object with all fields
        Movie m3 = new Movie("The Dark Knight", "Charles Roven", "Christopher Nolan", 152, 2008, "Action");
        m3.displayInfo();
    }
}


