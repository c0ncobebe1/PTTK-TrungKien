package Garaman.servlet;

import Garaman.dao.AppointmentDAO;
import Garaman.model.Appointment;
import Garaman.model.Customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {
    private final AppointmentDAO appointmentDAO = new AppointmentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null || !"customer".equalsIgnoreCase(customer.getRole())) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            String dateStr = request.getParameter("appointmentDate");
            String timeStr = request.getParameter("appointmentTime");

            if (dateStr == null || dateStr.isEmpty() || timeStr == null || timeStr.isEmpty()) {
                request.setAttribute("error", "⚠️ Please select a date and time.");
                request.getRequestDispatcher("BookAppointmentForm.jsp").forward(request, response);
                return;
            }

            LocalDateTime appointmentDateTime = LocalDateTime.parse(dateStr + "T" + timeStr);
            if (appointmentDateTime.isBefore(LocalDateTime.now())) {
                request.setAttribute("error", "❌ You cannot book an appointment in the past.");
                request.getRequestDispatcher("BookAppointmentForm.jsp").forward(request, response);
                return;
            }

            Date date = Date.valueOf(appointmentDateTime.toLocalDate());
            Time time = Time.valueOf(appointmentDateTime.toLocalTime());
            Appointment appointment = new Appointment(0, date, time, "Pending", customer);

            boolean ok = appointmentDAO.saveAppointment(appointment);

            if (ok) {
                session.setAttribute("success", "✅ Appointment booked successfully!");
                response.sendRedirect("BookAppointmentForm.jsp");
            } else {
                request.setAttribute("error", "⚠️ Appointment already exists or could not be booked!");
                request.getRequestDispatcher("BookAppointmentForm.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "⚠️ Invalid date/time format!");
            request.getRequestDispatcher("BookAppointmentForm.jsp").forward(request, response);
        }
    }
}
