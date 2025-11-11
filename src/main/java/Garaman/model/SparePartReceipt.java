package Garaman.model;

import java.sql.Date;

public class SparePartReceipt {
    private int id;
    private Supplier supplier;
    private Date date;
    private double totalAmount;
    private WarehouseStaff warehouseStaff;
    
    public SparePartReceipt() {}

    public SparePartReceipt(int id, Supplier supplier, Date date, double totalAmount) {
        this.id = id;
        this.supplier = supplier;
        this.date = date;
        this.totalAmount = totalAmount;
    }
    
    public SparePartReceipt(int id, Supplier supplier, Date date, double totalAmount, WarehouseStaff warehouseStaff) {
        this.id = id;
        this.supplier = supplier;
        this.date = date;
        this.totalAmount = totalAmount;
        this.warehouseStaff = warehouseStaff;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Supplier getSupplier() { return supplier; }
    public void setSupplier(Supplier supplier) { this.supplier = supplier; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    
    public WarehouseStaff getWarehouseStaff() { return warehouseStaff; }
    public void setWarehouseStaff(WarehouseStaff warehouseStaff) { this.warehouseStaff = warehouseStaff; }
}
