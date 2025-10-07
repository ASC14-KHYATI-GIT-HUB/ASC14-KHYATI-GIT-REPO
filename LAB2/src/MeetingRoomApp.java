import java.util.*;

// Base class for all meeting rooms
class MeetingRoom {
    private String roomId;
    private int capacity;
    private int floor;

    public MeetingRoom(String roomId, int capacity, int floor) {
        this.roomId = roomId;
        this.capacity = capacity;
        this.floor = floor;
    }

    public String getRoomId() {
        return roomId;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getFloor() {
        return floor;
    }

    public boolean hasZoom() {
        return false;
    }

    @Override
    public String toString() {
        return "Room ID: " + roomId + ", Capacity: " + capacity + ", Floor: " + floor;
    }
}

// Subclass for Zoom-enabled meeting rooms
class ZoomMeetingRoom extends MeetingRoom {
    private String zoomDeviceId;
    private String zoomAccountId;

    public ZoomMeetingRoom(String roomId, int capacity, int floor, String zoomDeviceId, String zoomAccountId) {
        super(roomId, capacity, floor);
        this.zoomDeviceId = zoomDeviceId;
        this.zoomAccountId = zoomAccountId;
    }

    @Override
    public boolean hasZoom() {
        return true;
    }

    public String getZoomDeviceId() {
        return zoomDeviceId;
    }

    public String getZoomAccountId() {
        return zoomAccountId;
    }

    @Override
    public String toString() {
        return super.toString() + ", Zoom Device ID: " + zoomDeviceId + ", Zoom Account ID: " + zoomAccountId;
    }
}

// Booking class
class Booking {
    private String employeeId;
    private String roomId;
    private String date;
    private String time;
    private int duration;

    public Booking(String employeeId, String roomId, String date, String time, int duration) {
        this.employeeId = employeeId;
        this.roomId = roomId;
        this.date = date;
        this.time = time;
        this.duration = duration;
    }

    public String getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "Employee ID: " + employeeId + ", Room ID: " + roomId +
                ", Date: " + date + ", Time: " + time + ", Duration: " + duration + " mins";
    }
}

// Booking manager to store and retrieve bookings
class BookingManager {
    private List<Booking> bookings = new ArrayList<>();

    public void addBooking(Booking booking) {
        bookings.add(booking);
    }

    public List<Booking> getBookingsByDate(String date) {
        List<Booking> result = new ArrayList<>();
        for (Booking b : bookings) {
            if (b.getDate().equals(date)) {
                result.add(b);
            }
        }
        return result;
    }
}


public class MeetingRoomApp {
    public static void main(String[] args) {
        // Create meeting rooms
        MeetingRoom room1 = new MeetingRoom("MR101", 10, 2);
        ZoomMeetingRoom room2 = new ZoomMeetingRoom("MR102", 8, 3, "ZD001", "zoom@company.com");

        // Display room details
        System.out.println("Meeting Rooms:");
        System.out.println(room1);
        System.out.println(room2);

        // Create bookings
        BookingManager manager = new BookingManager();
        manager.addBooking(new Booking("EMP001", room1.getRoomId(), "2025-09-26", "10:00", 60));
        manager.addBooking(new Booking("EMP002", room2.getRoomId(), "2025-09-26", "11:30", 45));
        manager.addBooking(new Booking("EMP003", room1.getRoomId(), "2025-09-27", "09:00", 30));


        System.out.println("\nBookings on 2025-09-18:");
        List<Booking> bookings = manager.getBookingsByDate("2025-09-18");
        for (Booking b : bookings) {
            System.out.println(b);
        }
    }
}
