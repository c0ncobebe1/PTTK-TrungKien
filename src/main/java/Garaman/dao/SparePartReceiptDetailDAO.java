package Garaman.dao;

import Garaman.model.SparePartReceiptDetailStat;
import Garaman.model.SparePart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SparePartReceiptDetailDAO extends DAO {

    // Lấy chi tiết các spare part trong một phiếu nhập
    public List<SparePartReceiptDetailStat> getReceiptDetails(int receiptId) {
        List<SparePartReceiptDetailStat> list = new ArrayList<>();
        String sql = """
            SELECT 
                sprd.id as DetailId,
                sp.id as SparePartId,
                sp.name as SparePartName,
                sprd.quantity as Quantity,
                ROUND(sprd.totalPrice / sprd.quantity, 2) as UnitPrice,
                sprd.totalPrice as Total
            FROM tblSparePartReceiptDetail sprd
            JOIN tblSparePart sp ON sprd.tblSparePartId = sp.id
            WHERE sprd.tblSparePartReceiptId = ?
        """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, receiptId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SparePart sparePart = new SparePart();
                sparePart.setId(rs.getInt("SparePartId"));
                sparePart.setName(rs.getString("SparePartName"));
                
                SparePartReceiptDetailStat detail = new SparePartReceiptDetailStat(
                    rs.getInt("DetailId"),
                    sparePart,
                    rs.getInt("Quantity"),
                    rs.getDouble("UnitPrice"),
                    rs.getDouble("Total")
                );
                list.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
