public class TestMain {
    public static void main(String[] args) {

        Student s1 = new Student(101, "", "", 0, 0, 0, 0.0f, false);
        Student s2 = new Student(102, "", "", 0, 0, 0, 0.0f, false);
        Student s3 = new Student(103, "", "", 0, 0, 0, 0.0f, false);

        s1.setStudentName("Khyati");
        s1.setCity("Pune");
        s1.setMarks1(89);
        s1.setMarks2(90);
        s1.setMarks3(92);
        s1.setFeePerMonth(2500.50f);
        s1.setIsEligibleForScholarship(true);

        s2.setStudentName("Saniya");
        s2.setCity("Mumbai");
        s2.setMarks1(75);
        s2.setMarks2(80);
        s2.setMarks3(70);
        s2.setFeePerMonth(2200.00f);
        s2.setIsEligibleForScholarship(false);

        s3.setStudentName("Sakshi");
        s3.setCity("Bangalore");
        s3.setMarks1(95);
        s3.setMarks2(92);
        s3.setMarks3(89);
        s3.setFeePerMonth(2000.75f);
        s3.setIsEligibleForScholarship(true);


        Student topStudent = s1;
        if (s2.getTotalMarks() > topStudent.getTotalMarks()) topStudent = s2;
        if (s3.getTotalMarks() > topStudent.getTotalMarks()) topStudent = s3;

        System.out.println("\nStudent with highest total marks: " + topStudent.getStudentName());

        Student leastFeeStudent = s1;
        if (s2.getFeePerMonth() < leastFeeStudent.getFeePerMonth()) leastFeeStudent = s2;
        if (s3.getFeePerMonth() < leastFeeStudent.getFeePerMonth()) leastFeeStudent = s3;

        System.out.println("Student with least monthly fee: " + leastFeeStudent.getStudentName() + " - ₹" + leastFeeStudent.getFeePerMonth());


        System.out.println("\n--- Student Details ---");
        Student[] students = {s1, s2, s3};
        for (Student s : students) {
            System.out.println("\nName: " + s.getStudentName());
            System.out.println("Total Marks: " + s.getTotalMarks());
            System.out.println("Average Marks: " + s.getAverage());
            System.out.println("Result: " + s.getResult());
            System.out.println("Scholarship Status: " + (s.getIsEligibleForScholarship() ? "Eligible" : "Not Eligible"));
        }
    }
}
