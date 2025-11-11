package Garaman.servlet;

import Garaman.dao.SupplierDAO;
import Garaman.model.SupplierStat;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/supplierStatistic")
public class SupplierStatisticServlet extends HttpServlet {

    private final SupplierDAO supplierDAO = new SupplierDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleMainView(request, response);
    }
    
    private void handleMainView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        
        List<SupplierStat> supplierStats;
        
        if (start != null && end != null && !start.isEmpty() && !end.isEmpty()) {
            Date startDate = Date.valueOf(start);
            Date endDate = Date.valueOf(end);

            if (startDate.after(endDate)) {
                request.setAttribute("errorMsg", "❌ Start date cannot be after end date!");
                supplierStats = supplierDAO.getSupplierImportStatistics(null, null);
            } else {
                supplierStats = supplierDAO.getSupplierImportStatistics(startDate, endDate);
                request.setAttribute("startDate", start);
                request.setAttribute("endDate", end);
            }
        } else {
            supplierStats = supplierDAO.getSupplierImportStatistics(null, null);
        }
        
        int totalImports = supplierStats.stream().mapToInt(SupplierStat::getTotalImports).sum();
        double totalValue = supplierStats.stream().mapToDouble(SupplierStat::getTotalValue).sum();

        request.setAttribute("supplierStats", supplierStats);
        request.setAttribute("totalImports", totalImports);
        request.setAttribute("totalValue", totalValue);

        request.getRequestDispatcher("SupplierStatisticView.jsp").forward(request, response);
    }
}
