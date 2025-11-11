package Garaman.model;

public class SparePartReceiptDetailStat extends SparePartReceiptDetail {
    private double totalAmount;

    public SparePartReceiptDetailStat() {
        super();
    }

    public SparePartReceiptDetailStat(int id, SparePart sparePart, int quantity, double unitPrice, double total) {
        super(id, sparePart, quantity, unitPrice);
        this.totalAmount = total;
    }

    public double getTotalAmount() { 
        return totalAmount; 
    }
    
    public void setTotalAmount(double total) { 
        this.totalAmount = total; 
    }
}
