public class MovieTest {


    protected String movieName;
    protected String producedBy;

    public MovieTest(String movieName, String producedBy) {
        this.movieName = movieName;
        this.producedBy = producedBy;
    }

    public void displayBasicInfo() {
        System.out.println("Movie Name: " + movieName);
        System.out.println("Produced By: " + producedBy);
    }
}

