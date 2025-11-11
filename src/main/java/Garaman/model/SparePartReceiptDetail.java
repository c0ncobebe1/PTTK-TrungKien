package Garaman.model;

public class SparePartReceiptDetail {
    private int id;
    private SparePart sparePart;
    private int quantity;
    private double unitPrice;
    
    public SparePartReceiptDetail() {
    }
    
    public SparePartReceiptDetail(int id, SparePart sparePart, int quantity, double unitPrice) {
        this.id = id;
        this.sparePart = sparePart;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public SparePart getSparePart() {
        return sparePart;
    }
    
    public void setSparePart(SparePart sparePart) {
        this.sparePart = sparePart;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getUnitPrice() {
        return unitPrice;
    }
    
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
