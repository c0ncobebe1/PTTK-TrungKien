package Garaman.model;

import java.sql.Date;
import java.sql.Time;

public class Appointment {
    private int id;
    private Date appointmentDate;
    private Time appointmentTime;
    private String status;
    private Customer customer;

    public Appointment() {}

    public Appointment(int id, Date appointmentDate, Time appointmentTime, String status) {
        this.id = id;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.status = status;
    }

    public Appointment(int id, Date appointmentDate, Time appointmentTime, String status, Customer customer) {
        this.id = id;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.status = status;
        this.customer = customer;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(Date appointmentDate) { this.appointmentDate = appointmentDate; }

    public Time getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(Time appointmentTime) { this.appointmentTime = appointmentTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }
}
