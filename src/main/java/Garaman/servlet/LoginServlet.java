package Garaman.servlet;

import Garaman.dao.UserDAO;
import Garaman.dao.StaffDAO;
import Garaman.model.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    private final StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User baseMember = userDAO.login(username, password);

        if (baseMember != null) {
            HttpSession session = request.getSession();

            String role = baseMember.getRole().toLowerCase();
            User user = baseMember; 

            switch (role) {
                case "customer" -> {
                    Customer customer = new Customer();
                    copyMemberFields(baseMember, customer);
                    user = customer;
                    session.setAttribute("user", user);
                    response.sendRedirect("CustomerHome.jsp");
                    return;
                }

                case "staff" -> {
                    String position = staffDAO.getStaffPosition(baseMember.getId());
                    
                    if (position == null || position.trim().isEmpty()) {
                        response.sendRedirect("Login.jsp?error=noPosition");
                        return;
                    }
                    
                    position = position.toLowerCase();
                    session.setAttribute("position", position);

                    if ("manager".equalsIgnoreCase(position)) {
                        Manager manager = new Manager(position);
                        copyMemberFields(baseMember, manager);
                        user = manager;
                        session.setAttribute("user", user);
                        response.sendRedirect("ManagerHome.jsp");
                        return;
                    }
                    else {
                        response.sendRedirect("Login.jsp?error=unknownPosition");
                        return;
                    }
                }

                default -> {
                    response.sendRedirect("Login.jsp?error=role");
                    return;
                }
            }

        } else {
            response.sendRedirect("Login.jsp?error=invalid");
        }
    }

    private void copyMemberFields(User src, User dest) {
        dest.setId(src.getId());
        dest.setName(src.getName());
        dest.setUsername(src.getUsername());
        dest.setPassword(src.getPassword());
        dest.setBirthday(src.getBirthday());
        dest.setAddress(src.getAddress());
        dest.setEmail(src.getEmail());
        dest.setPhoneNumber(src.getPhoneNumber());
        dest.setRole(src.getRole());
        dest.setGender(src.getGender());
    }
}
