package Garaman.servlet;

import Garaman.dao.SupplierDAO;
import Garaman.dao.SparePartReceiptDAO;
import Garaman.dao.SparePartReceiptDetailDAO;
import Garaman.model.SparePartReceiptDetailStat;
import Garaman.model.SparePartReceiptStat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/receiptDetail")
public class ReceiptDetailServlet extends HttpServlet {
    
    private SupplierDAO supplierDAO;
    private SparePartReceiptDAO sparePartReceiptDAO;
    private SparePartReceiptDetailDAO sparePartReceiptDetailDAO;
    
    @Override
    public void init() throws ServletException {
        supplierDAO = new SupplierDAO();
        sparePartReceiptDAO = new SparePartReceiptDAO();
        sparePartReceiptDetailDAO = new SparePartReceiptDetailDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String receiptIdStr = request.getParameter("receiptId");
        String supplierIdStr = request.getParameter("supplierId");
        
        if (receiptIdStr == null) {
            response.sendRedirect("supplierStatistic");
            return;
        }
        
        try {
            int receiptId = Integer.parseInt(receiptIdStr);
            
            SparePartReceiptStat receipt = sparePartReceiptDAO.getReceiptById(receiptId);
            if (receipt == null) {
                response.sendRedirect("supplierStatistic");
                return;
            }
            
            List<SparePartReceiptDetailStat> details = sparePartReceiptDetailDAO.getReceiptDetails(receiptId);
            
            double total = details.stream().mapToDouble(SparePartReceiptDetailStat::getTotalAmount).sum();
            
            Garaman.model.Supplier supplier = null;
            if (supplierIdStr != null && !supplierIdStr.isEmpty()) {
                try {
                    int supplierId = Integer.parseInt(supplierIdStr);
                    supplier = supplierDAO.getSupplierById(supplierId);
                } catch (NumberFormatException e) {
                    // Ignore invalid supplierId
                }
            }
            
            request.setAttribute("receipt", receipt);
            request.setAttribute("details", details);
            request.setAttribute("total", total);
            request.setAttribute("supplier", supplier);
            request.setAttribute("supplierId", supplierIdStr);
            
            request.getRequestDispatcher("ReceiptDetailView.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("supplierStatistic");
        }
    }
}
