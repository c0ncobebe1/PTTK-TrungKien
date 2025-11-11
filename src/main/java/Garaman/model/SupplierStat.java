package Garaman.model;

public class SupplierStat extends Supplier {
    private int totalImports;      // Tổng số lượng phụ tùng đã nhập
    private double totalValue;     // Tổng giá trị nhập hàng

    public SupplierStat() {
        super();
    }

    public SupplierStat(int id, String name, String phoneNumber, String email, 
                        int totalImports, double totalValue) {
        super(id, name, null, phoneNumber, email);  // address = null vì không dùng trong statistic
        this.totalImports = totalImports;
        this.totalValue = totalValue;
    }

    public int getTotalImports() { return totalImports; }
    public void setTotalImports(int totalImports) { this.totalImports = totalImports; }

    public double getTotalValue() { return totalValue; }
    public void setTotalValue(double totalValue) { this.totalValue = totalValue; }
}
