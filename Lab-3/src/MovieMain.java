public class MovieMain {

    private static int moviesCount = 0;

    private String movieName;
    private String producedBy;
    private String directedBy;
    private int duration;
    private int year;
    private String category;

    public MovieMain(String movieName, String producedBy) {
        this.movieName = movieName;
        this.producedBy = producedBy;
        moviesCount++;
    }

    public MovieMain(String movieName, String producedBy, String directedBy, int duration, int year, String category) {
        this(movieName, producedBy);
        this.directedBy = directedBy;
        this.duration = duration;
        this.year = year;
        this.category = category;
    }

    // Static method to get moviesCount
    public static int getMoviesCount() {
        return moviesCount;
    }

    public void displayInfo() {
        System.out.println("Movie Name: " + movieName);
        System.out.println("Produced By: " + producedBy);
        System.out.println("Directed By: " + directedBy);
        System.out.println("Duration: " + duration + " minutes");
        System.out.println("Year: " + year);
        System.out.println("Category: " + category);
    }

    public static void main(String[] args) {
        Movie m1 = new Movie("Interstellar", "Emma Thomas");
        Movie m2 = new Movie("Tenet", "Emma Thomas", "Christopher Nolan", 150, 2020, "Action");

        m1.displayInfo();
        System.out.println();

        m2.displayInfo();
        System.out.println();


        System.out.println("Total Movies Created: " + MovieMain.getMoviesCount());
    }
}


