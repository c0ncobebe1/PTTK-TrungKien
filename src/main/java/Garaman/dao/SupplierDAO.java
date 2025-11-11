package Garaman.dao;

import Garaman.model.Supplier;
import Garaman.model.SupplierStat;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO extends DAO {

    public List<SupplierStat> getSupplierImportStatistics(Date startDate, Date endDate) {
        List<SupplierStat> list = new ArrayList<>();
        
        String sql;
        if (startDate == null || endDate == null) {
            sql = """
                SELECT 
                    s.id as SupplierID,
                    s.name as SupplierName,
                    s.phoneNumber as PhoneNumber,
                    s.email as Email,
                    COALESCE(SUM(sprd.quantity), 0) as TotalImports,
                    COALESCE(SUM(sprd.totalPrice), 0) as TotalValue
                FROM tblSupplier s
                LEFT JOIN tblSparePartReceipt spr ON s.id = spr.tblSupplierId
                LEFT JOIN tblSparePartReceiptDetail sprd ON spr.id = sprd.tblSparePartReceiptId
                GROUP BY s.id, s.name, s.phoneNumber, s.email
                HAVING TotalImports > 0
                ORDER BY TotalValue DESC
            """;
        } else {
            sql = """
                SELECT 
                    s.id as SupplierID,
                    s.name as SupplierName,
                    s.phoneNumber as PhoneNumber,
                    s.email as Email,
                    COALESCE(SUM(sprd.quantity), 0) as TotalImports,
                    COALESCE(SUM(sprd.totalPrice), 0) as TotalValue
                FROM tblSupplier s
                LEFT JOIN tblSparePartReceipt spr ON s.id = spr.tblSupplierId
                LEFT JOIN tblSparePartReceiptDetail sprd ON spr.id = sprd.tblSparePartReceiptId
                WHERE spr.receiptDate BETWEEN ? AND ?
                GROUP BY s.id, s.name, s.phoneNumber, s.email
                ORDER BY TotalValue DESC
            """;
        }

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            
            if (startDate != null && endDate != null) {
                ps.setDate(1, startDate);
                ps.setDate(2, endDate);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SupplierStat stat = new SupplierStat(
                    rs.getInt("SupplierID"),
                    rs.getString("SupplierName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Email"),
                    rs.getInt("TotalImports"),
                    rs.getDouble("TotalValue")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy thông tin chi tiết nhập hàng của một supplier
    public Supplier getSupplierById(int supplierId) {
        String sql = "SELECT * FROM tblSupplier WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, supplierId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return new Supplier(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("phoneNumber"),
                    rs.getString("email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy tất cả suppliers
    public List<Supplier> getAllSuppliers() {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM tblSupplier ORDER BY name";
        
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Supplier supplier = new Supplier(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("phoneNumber"),
                    rs.getString("email")
                );
                list.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
