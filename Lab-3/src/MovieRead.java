public class MovieRead {

    private static int moviesCount = 0;

    private String movieName;
    private String producedBy;
    private String directedBy;
    private int duration;
    private int year;
    private String category;

    private final String movieId;

    public MovieRead(String movieName, String producedBy) {
        this.movieName = movieName;
        this.producedBy = producedBy;
        moviesCount++;
        this.movieId = movieName + "_" + moviesCount;
    }

    public MovieRead(String movieName, String producedBy, String directedBy, int duration, int year, String category) {
        this(movieName, producedBy);
        this.directedBy = directedBy;
        this.duration = duration;
        this.year = year;
        this.category = category;
    }

    public String getMovieId() {
        return movieId;
    }

    public static int getMoviesCount() {
        return moviesCount;
    }

    public void displayInfo() {
        System.out.println("Movie ID: " + movieId);
        System.out.println("Movie Name: " + movieName);
        System.out.println("Produced By: " + producedBy);
        System.out.println("Directed By: " + directedBy);
        System.out.println("Duration: " + duration + " minutes");
        System.out.println("Year: " + year);
        System.out.println("Category: " + category);
    }

    public static void main(String[] args) {
        Movie m1 = new Movie("Hello", "John Smith");
        Movie m2 = new Movie("Avengers", "Kevin Feige", "Joss Whedon", 143, 2012, "Action");

        m1.displayInfo();
        System.out.println();

        m2.displayInfo();
        System.out.println();

        System.out.println("Total Movies Created: " + MovieRead.getMoviesCount());
    }
}


