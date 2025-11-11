package Garaman.dao;

import Garaman.model.SparePartReceiptStat;
import Garaman.model.WarehouseStaff;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SparePartReceiptDAO extends DAO {

    // Lấy danh sách các phiếu nhập của một supplier
    public List<SparePartReceiptStat> getSupplierReceipts(int supplierId) {
        List<SparePartReceiptStat> list = new ArrayList<>();
        String sql = """
            SELECT 
                spr.id as ReceiptID,
                spr.receiptDate as ReceiptDate,
                COALESCE(SUM(sprd.totalPrice), 0) as TotalAmount,
                ws.id as WarehouseStaffId,
                m.name as WarehouseStaffName
            FROM tblSparePartReceipt spr
            LEFT JOIN tblWarehouseStaff ws ON spr.tblWarehouseStaffId = ws.id
            LEFT JOIN tblUser m ON ws.tblUserId = m.id
            LEFT JOIN tblSparePartReceiptDetail sprd ON spr.id = sprd.tblSparePartReceiptId
            WHERE spr.tblSupplierId = ?
            GROUP BY spr.id, spr.receiptDate, ws.id, m.name
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, supplierId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                WarehouseStaff warehouseStaff = null;
                if (rs.getObject("WarehouseStaffId") != null) {
                    warehouseStaff = new WarehouseStaff();
                    warehouseStaff.setId(rs.getInt("WarehouseStaffId"));
                    warehouseStaff.setName(rs.getString("WarehouseStaffName"));
                }
                
                SparePartReceiptStat receipt = new SparePartReceiptStat(
                    rs.getInt("ReceiptID"),
                    rs.getDate("ReceiptDate"),
                    rs.getDouble("TotalAmount"),
                    warehouseStaff
                );
                list.add(receipt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Lấy thông tin receipt theo ID
    public SparePartReceiptStat getReceiptById(int receiptId) {
        String sql = """
            SELECT 
                spr.id as ReceiptID,
                spr.receiptDate as ReceiptDate,
                COALESCE(SUM(sprd.totalPrice), 0) as TotalAmount,
                ws.id as WarehouseStaffId,
                m.name as WarehouseStaffName
            FROM tblSparePartReceipt spr
            LEFT JOIN tblWarehouseStaff ws ON spr.tblWarehouseStaffId = ws.id
            LEFT JOIN tblUser m ON ws.tblUserId = m.id
            LEFT JOIN tblSparePartReceiptDetail sprd ON spr.id = sprd.tblSparePartReceiptId
            WHERE spr.id = ?
            GROUP BY spr.id, spr.receiptDate, ws.id, m.name
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, receiptId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                WarehouseStaff warehouseStaff = null;
                if (rs.getObject("WarehouseStaffId") != null) {
                    warehouseStaff = new WarehouseStaff();
                    warehouseStaff.setId(rs.getInt("WarehouseStaffId"));
                    warehouseStaff.setName(rs.getString("WarehouseStaffName"));
                }
                
                return new SparePartReceiptStat(
                    rs.getInt("ReceiptID"),
                    rs.getDate("ReceiptDate"),
                    rs.getDouble("TotalAmount"),
                    warehouseStaff
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
