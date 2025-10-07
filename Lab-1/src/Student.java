public class Student {


    private int studentId;
    private String studentName;
    private String city;
    private int marks1;
    private int marks2;
    private int marks3;
    private float feePerMonth;
    private boolean isEligibleForScholarship;

    public Student(int studentId, String studentName, String city, int marks1, int marks2, int marks3, float feePerMonth, boolean isEligibleForScholarship) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.city = city;
        this.marks1 = marks1;
        this.marks2 = marks2;
        this.marks3 = marks3;
        this.feePerMonth = feePerMonth;
        this.isEligibleForScholarship = isEligibleForScholarship;
    }


    public void setStudentId(int studentId) { this.studentId = studentId; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public void setCity(String city) { this.city = city; }
    public void setMarks1(int marks1) { this.marks1 = marks1; }
    public void setMarks2(int marks2) { this.marks2 = marks2; }
    public void setMarks3(int marks3) { this.marks3 = marks3; }
    public void setFeePerMonth(float feePerMonth) { this.feePerMonth = feePerMonth; }
    public void setIsEligibleForScholarship(boolean isEligibleForScholarship) { this.isEligibleForScholarship = isEligibleForScholarship; }

    public int getStudentId() { return studentId; }
    public String getStudentName() { return studentName; }
    public String getCity() { return city; }
    public int getMarks1() { return marks1; }
    public int getMarks2() { return marks2; }
    public int getMarks3() { return marks3; }
    public float getFeePerMonth() { return feePerMonth; }
    public boolean getIsEligibleForScholarship() { return isEligibleForScholarship; }

    public float getAnnualFee() {
        return feePerMonth * 12;
    }

    public int getTotalMarks() {
        return marks1 + marks2 + marks3;
    }
    public float getAverage() {
        return getTotalMarks() / 3.0f;
    }
    public String getResult() {
        if (marks1 > 60 && marks2 > 60 && marks3 > 60) {
            return "pass";
        } else {
            return "fail";
        }
    }

    public void displayDetails() {
        System.out.println("Student ID: " + studentId);
        System.out.println("Name: " + studentName);
        System.out.println("City: " + city);
        System.out.println("Marks1: " + marks1);
        System.out.println("Marks2: " + marks2);
        System.out.println("Marks3: " + marks3);
        System.out.println("Monthly Fee: " + feePerMonth);
        System.out.println("Eligible for Scholarship: " + isEligibleForScholarship);
        System.out.println("Annual Fee: " + getAnnualFee());
        System.out.println("Total Marks: " + getTotalMarks());
        System.out.println("Average Marks: " + getAverage());
        System.out.println("Result: " + getResult());
    }

    public static void main(String[] args) {
        Student s1 = new Student(101, "Mavya", "Chennai", 85, 90, 88, 1500.50f, true);
        s1.displayDetails();
    }
}
