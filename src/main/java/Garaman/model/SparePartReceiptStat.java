package Garaman.model;

import java.sql.Date;

public class SparePartReceiptStat extends SparePartReceipt {
    private double totalPrice;      // Tổng giá trị phiếu nhập (calculated from details)
    private int totalSparePart;     // Tổng số lượng phụ tùng
    
    public SparePartReceiptStat() {
        super();
    }
    
    public SparePartReceiptStat(int id, Date date, double totalAmount, WarehouseStaff warehouseStaff) {
        super(id, null, date, totalAmount, warehouseStaff);  // supplier = null vì không dùng trong stat
    }
    
    public double getTotalPrice() {
        return totalPrice;
    }
    
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public int getTotalSparePart() {
        return totalSparePart;
    }
    
    public void setTotalSparePart(int totalSparePart) {
        this.totalSparePart = totalSparePart;
    }
}
