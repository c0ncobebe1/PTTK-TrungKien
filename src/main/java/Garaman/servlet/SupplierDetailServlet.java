package Garaman.servlet;

import Garaman.dao.SupplierDAO;
import Garaman.dao.SparePartReceiptDAO;
import Garaman.model.Supplier;
import Garaman.model.SparePartReceiptStat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/supplierDetail")
public class SupplierDetailServlet extends HttpServlet {
    
    private SupplierDAO supplierDAO;
    private SparePartReceiptDAO sparePartReceiptDAO;
    
    @Override
    public void init() throws ServletException {
        supplierDAO = new SupplierDAO();
        sparePartReceiptDAO = new SparePartReceiptDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String supplierIdStr = request.getParameter("supplierId");
        
        if (supplierIdStr == null) {
            response.sendRedirect("supplierStatistic");
            return;
        }
        
        try {
            int supplierId = Integer.parseInt(supplierIdStr);
            
            Supplier supplier = supplierDAO.getSupplierById(supplierId);
            if (supplier == null) {
                response.sendRedirect("supplierStatistic");
                return;
            }
            
            List<SparePartReceiptStat> receipts = sparePartReceiptDAO.getSupplierReceipts(supplierId);
            
            double totalValue = receipts.stream().mapToDouble(SparePartReceiptStat::getTotalAmount).sum();
            
            request.setAttribute("supplier", supplier);
            request.setAttribute("receipts", receipts);
            request.setAttribute("totalValue", totalValue);
            
            request.getRequestDispatcher("SupplierDetailView.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("supplierStatistic");
        }
    }
}
