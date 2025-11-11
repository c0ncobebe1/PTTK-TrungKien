USE garaman;
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tblServiceRequest;
TRUNCATE TABLE tblSparePartRequest;
TRUNCATE TABLE tblRequest;
TRUNCATE TABLE tblInvoice;
TRUNCATE TABLE tblAppointment;
TRUNCATE TABLE tblService;
TRUNCATE TABLE tblSparePartReceiptDetail;
TRUNCATE TABLE tblSparePartReceipt;
TRUNCATE TABLE tblSparePart;
TRUNCATE TABLE tblSupplier;
TRUNCATE TABLE tblWarehouseStaff;
TRUNCATE TABLE tblTechnicalStaff;
TRUNCATE TABLE tblStaff;
TRUNCATE TABLE tblUser;

-- ===================================================
-- 1️⃣ DỮ LIỆU NHÂN SỰ
-- ===================================================
INSERT INTO tblUser (name, username, password, birthday, address, email, phoneNumber, role, gender) VALUES
                                                                                                          ('Nguyễn Trung Kiên', 'manager', '1', '1995-05-10', 'Hà Nội', 'kien.nv@gmail.com', '0901233567', 'Customer', 'Male'),
                                                                                                          ('Trần Thị B', 'sales_b', '1', '1990-11-20', 'Đà Nẵng', 'b.tt@example.com', '0912345678', 'Staff', 'Female'),
                                                                                                          ('Lê Văn C', 'warehouse_c', '1', '1985-01-15', 'Hải Phòng', 'c.lv@example.com', '0923456789', 'Staff', 'Male'),
                                                                                                          ('Phạm Minh D', 'technician_d', '1', '1992-07-25', 'Cần Thơ', 'd.pm@example.com', '0934567890', 'Staff', 'Male'),
                                                                                                          ('Phan Trọng G', 'customer_g', '1', '1988-02-29', 'Huế', 'g.pt@example.com', '0961122334', 'Customer', 'Male'),
                                                                                                          ('Nguyễn Trung Kiên', 'kien', '1', '2004-11-18', 'Thái Nguyên', 'kien@gmail.com', '0385183985', 'Staff', 'Male');

INSERT INTO tblStaff (tblUserId, position) VALUES
                                                 (2, 'Sales'), (3, 'Warehouse'), (4, 'Technician'),
                                                 (6, 'Manager'), (12, 'Sales'), (13, 'Sales');

INSERT INTO tblTechnicalStaff (tblStaffId, skills) VALUES
    (4, 'Engine Repair, Suspension, Brakes');

-- Warehouse Staff (nhân viên kho)
INSERT INTO tblWarehouseStaff (tblUserId) VALUES
    (3);  -- Lê Văn C (warehouse_c)

-- ===================================================
-- 2️⃣ NHÀ CUNG CẤP / PHỤ TÙNG / DỊCH VỤ
-- ===================================================
INSERT INTO tblSupplier (name, address, phoneNumber, email) VALUES
('Công ty TNHH Phụ Tùng Ô Tô Việt Nam', 'KCN Tân Bình, TP.HCM', '0281234567', 'info@phutuongvn.com'),
('Nhà Phân Phối Bosch Việt Nam', 'Quận 1, TP.HCM', '0283456789', 'contact@bosch.vn'),
('Công ty CP Phụ Tùng Hà Nội', 'Hai Bà Trưng, Hà Nội', '0242345678', 'sales@ptuonghanoi.com'),
('NCC Denso Việt Nam', 'KCN Long Thành, Đồng Nai', '0251234567', 'denso@vietnam.com'),
('Tập Đoàn Phụ Tùng Á Châu', 'KCN Biên Hòa, Đồng Nai', '0252345678', 'achau@parts.vn'),
('Công ty TNHH NGK Spark Plug', 'KCN Vsip, Bình Dương', '0273456789', 'ngk@sparkplug.vn'),
('Nhà Cung Cấp Mahle Filter', 'Quận 7, TP.HCM', '0284567890', 'mahle@filter.com'),
('Công ty Valeo Việt Nam', 'KCN Thăng Long, Hà Nội', '0245678901', 'valeo@vietnam.vn'),
('NCC Mann Filter Asia', 'Quận Tân Bình, TP.HCM', '0286789012', 'mann@asia.com'),
('Công ty SKF Bearing Vietnam', 'KCN Amata, Đồng Nai', '0257890123', 'skf@bearing.vn'),
('Nhà Phân Phối Castrol', 'Quận 3, TP.HCM', '0288901234', 'castrol@oil.com'),
('Công ty Shell Lubricants VN', 'Ba Đình, Hà Nội', '0249012345', 'shell@lube.vn'),
('NCC Total Energies Vietnam', 'Quận 2, TP.HCM', '0280123456', 'total@energy.com'),
('Công ty Mobil 1 Việt Nam', 'Cầu Giấy, Hà Nội', '0241234568', 'mobil1@vietnam.vn'),
('Nhà Cung Cấp Motul', 'Quận Gò Vấp, TP.HCM', '0282345679', 'motul@lubricant.com'),
('Công ty TNHH Exide Battery', 'KCN Tân Thuận, TP.HCM', '0283456780', 'exide@battery.vn'),
('NCC GS Yuasa Vietnam', 'KCN Quang Minh, Hà Nội', '0244567891', 'gsyuasa@power.com'),
('Công ty ACDelco Asia Pacific', 'Quận 10, TP.HCM', '0285678902', 'acdelco@parts.com'),
('Nhà Phân Phối Michelin', 'Hai Bà Trưng, Hà Nội', '0246789013', 'michelin@tire.vn'),
('Công ty Bridgestone Vietnam', 'KCN Biên Hòa 2, Đồng Nai', '0258901234', 'bridgestone@vn.com'),
('NCC Goodyear Tire Vietnam', 'Quận Bình Thạnh, TP.HCM', '0289012345', 'goodyear@vietnam.vn'),
('Công ty Continental Tire VN', 'Cầu Giấy, Hà Nội', '0240234567', 'continental@tire.com'),
('Nhà Cung Cấp Pirelli', 'Quận 7, TP.HCM', '0281345678', 'pirelli@vietnam.vn'),
('Công ty TNHH Wix Filters', 'KCN Long Hậu, Long An', '0272456789', 'wix@filters.com'),
('NCC Champion Spark Plug', 'Quận Tân Phú, TP.HCM', '0283567890', 'champion@spark.vn'),
('Công ty Aisin Vietnam', 'KCN Tân Bình, TP.HCM', '0284678901', 'aisin@parts.com'),
('Nhà Phân Phối TRW Automotive', 'Hoàn Kiếm, Hà Nội', '0245789012', 'trw@auto.vn'),
('Công ty ZF Parts Vietnam', 'Quận 5, TP.HCM', '0286890123', 'zf@parts.com'),
('NCC Brembo Brake Systems', 'KCN Đồng An, Bình Dương', '0279901234', 'brembo@brake.vn'),
('Công ty Hella Lighting VN', 'Quận 12, TP.HCM', '0280012345', 'hella@light.com'),
('Nhà Cung Cấp Osram', 'Long Biên, Hà Nội', '0241123456', 'osram@lighting.vn'),
('Công ty Philips Automotive', 'Quận Thủ Đức, TP.HCM', '0282234567', 'philips@auto.com'),
('NCC Gates Corporation VN', 'KCN Vsip 2, Bình Dương', '0273345678', 'gates@belts.vn'),
('Công ty Dayco Products', 'Quận Tân Bình, TP.HCM', '0284456789', 'dayco@products.com'),
('Nhà Phân Phối Sachs', 'Thanh Xuân, Hà Nội', '0246567890', 'sachs@suspension.vn'),
('Công ty Monroe Shock VN', 'Quận 8, TP.HCM', '0287678901', 'monroe@shock.com'),
('NCC KYB Suspension', 'KCN Thăng Long, Hà Nội', '0248789012', 'kyb@suspension.vn'),
('Công ty Bilstein Vietnam', 'Quận 9, TP.HCM', '0288890123', 'bilstein@damper.com'),
('Nhà Cung Cấp Tenneco', 'KCN Long Thành, Đồng Nai', '0259901235', 'tenneco@exhaust.vn'),
('Công ty Walker Exhaust', 'Quận 4, TP.HCM', '0289012346', 'walker@muffler.com'),
('NCC Magneti Marelli', 'Hoàng Mai, Hà Nội', '0240123457', 'magneti@parts.vn'),
('Công ty Delphi Technologies', 'Quận 11, TP.HCM', '0281234568', 'delphi@tech.com'),
('Nhà Phân Phối Continental Belt', 'KCN Đồng Nai, Biên Hòa', '0252345679', 'conti@belt.vn'),
('Công ty Lucas Electrical', 'Đống Đa, Hà Nội', '0243456780', 'lucas@electric.com'),
('NCC Hengst Filter Vietnam', 'Quận 6, TP.HCM', '0285567891', 'hengst@filter.vn'),
('Công ty TNHH UFI Filters', 'KCN Quang Minh, Hà Nội', '0244678902', 'ufi@filters.com'),
('Nhà Cung Cấp Textar Brake', 'Quận Phú Nhuận, TP.HCM', '0287789013', 'textar@brake.vn'),
('Công ty Jurid Brake Parts', 'Nam Từ Liêm, Hà Nội', '0248890124', 'jurid@parts.com'),
('NCC ATE Brake Systems', 'Quận Bình Tân, TP.HCM', '0289901235', 'ate@brake.vn'),
('Công ty Ferodo Friction VN', 'KCN Tân Tạo, TP.HCM', '0280234568', 'ferodo@friction.com'),
('Nhà Phân Phối Pagid Racing', 'Hà Đông, Hà Nội', '0241345679', 'pagid@racing.vn'),
('Công ty EBC Brakes Asia', 'Quận 1, TP.HCM', '0282456780', 'ebc@brakes.com'),
('NCC Hawk Performance', 'KCN Bắc Ninh, Bắc Ninh', '0222567891', 'hawk@performance.vn'),
('Công ty StopTech Vietnam', 'Quận 3, TP.HCM', '0283678902', 'stoptech@brake.com'),
('Nhà Cung Cấp AP Racing', 'Cầu Giấy, Hà Nội', '0244789013', 'apracing@parts.vn'),
('Công ty Wilwood Engineering', 'Quận 7, TP.HCM', '0286890124', 'wilwood@brake.com');

INSERT INTO tblSparePart (name, description, stockQuantity, purchasePrice, sellingPrice) VALUES
('Lọc dầu động cơ', 'Lọc dầu tiêu chuẩn cho động cơ xăng', 120, 45000, 75000),
('Má phanh trước', 'Bộ má phanh đĩa trước ceramic', 85, 380000, 620000),
('Bugi chuẩn', 'Bugi đánh lửa tiêu chuẩn', 200, 18000, 32000),
('Dây curoa cam', 'Dây curoa phân phối cam', 45, 95000, 145000),
('Lọc gió động cơ', 'Lọc gió hộp số cao cấp', 95, 55000, 90000),
('Dầu nhớt tổng hợp 5W40', 'Dầu động cơ toàn tổng hợp', 150, 180000, 280000),
('Bơm xăng điện tử', 'Bơm nhiên liệu áp suất cao', 35, 850000, 1350000),
('Cảm biến oxy', 'Lambda sensor phía sau xúc tác', 40, 420000, 680000),
('Lọc nhiên liệu', 'Lọc xăng in-line', 110, 38000, 65000),
('Bugi iridium', 'Bugi điện cực iridium cao cấp', 80, 85000, 140000),
('Má phanh sau', 'Bộ má phanh trống sau', 70, 320000, 520000),
('Dây curoa phụ', 'Dây curoa phát điện & điều hòa', 55, 75000, 125000),
('Lọc dầu cao cấp', 'Lọc dầu hiệu suất cao', 90, 65000, 105000),
('Dầu nhớt bán tổng hợp 10W40', 'Dầu động cơ bán tổng hợp', 180, 120000, 190000),
('Bơm nước làm mát', 'Bơm tuần hoàn nước làm mát', 25, 650000, 1050000),
('Cảm biến nhiệt độ', 'Cảm biến nhiệt độ nước làm mát', 60, 180000, 290000),
('Lọc gió điều hòa', 'Lọc cabin than hoạt tính', 130, 48000, 80000),
('Bugi platinum', 'Bugi điện cực bạch kim', 65, 55000, 95000),
('Đĩa phanh trước', 'Đĩa phanh thông gió 280mm', 40, 580000, 950000),
('Cụm đèn pha LED', 'Đèn pha LED nguyên bộ', 20, 1850000, 2950000),
('Gối đỡ động cơ', 'Chân máy cao su nguyên bản', 50, 280000, 450000),
('Lọc dầu hộp số', 'Lọc dầu transmission tự động', 45, 95000, 155000),
('Dầu phanh DOT 4', 'Dầu thắng tiêu chuẩn DOT4', 200, 35000, 58000),
('Bình ắc quy 60Ah', 'Bình điện khởi động 12V 60Ah', 30, 850000, 1350000),
('Cảm biến áp suất lốp', 'TPMS sensor không dây', 75, 380000, 620000),
('Lọc gió turbo', 'Lọc không khí tăng áp', 35, 125000, 200000),
('Bugi ngắn', 'Bugi đánh lửa kiểu ngắn', 95, 22000, 38000),
('Đĩa phanh sau', 'Đĩa phanh sau nguyên bản', 38, 480000, 780000),
('Cụm đèn hậu LED', 'Đèn sau LED nguyên bộ', 18, 1650000, 2650000),
('Gối đỡ hộp số', 'Chân hộp số cao su', 42, 320000, 520000),
('Lọc nhiên liệu diesel', 'Lọc dầu diesel 2 tầng', 55, 85000, 140000),
('Dầu động cơ diesel 15W40', 'Dầu cho động cơ diesel', 140, 145000, 230000),
('Bình ắc quy 75Ah', 'Bình điện 12V 75Ah cao cấp', 25, 1150000, 1850000),
('Cảm biến vị trí trục khuỷu', 'CPS sensor động cơ', 48, 285000, 460000),
('Lọc gió cao cấp K&N', 'Lọc gió hiệu suất cao K&N', 22, 650000, 1050000),
('Bugi 2 điện cực', 'Bugi đánh lửa kép', 88, 42000, 72000),
('Má phanh gốm ceramic', 'Má phanh ceramic cao cấp', 32, 680000, 1100000),
('Dây curoa timing', 'Bộ dây đai cam nguyên bản', 28, 450000, 720000),
('Bơm dầu động cơ', 'Bơm dầu áp suất cao', 18, 980000, 1580000),
('Cảm biến khối lượng không khí', 'MAF sensor nguyên bản', 35, 1280000, 2050000),
('Lọc xăng trong bình', 'Lọc nhiên liệu ngâm trong bình', 65, 125000, 200000),
('Dầu vi sai', 'Dầu hộp số vi sai GL-5', 95, 85000, 140000),
('Bình ắc quy AGM 70Ah', 'Bình điện AGM công nghệ cao', 15, 1850000, 2950000),
('Cảm biến góc lái', 'Steering angle sensor', 28, 850000, 1380000),
('Lọc gió thô', 'Lọc gió sơ cấp động cơ diesel', 40, 68000, 110000),
('Bugi 4 điện cực', 'Bugi đa điện cực bền bỉ', 72, 58000, 95000),
('Đĩa côn', 'Đĩa ma sát ly hợp', 25, 580000, 950000),
('Má ép ly hợp', 'Bàn ép clutch pressure plate', 22, 950000, 1550000),
('Bơm ly hợp', 'Bơm trợ lực ly hợp', 30, 480000, 780000),
('Cảm biến tốc độ bánh xe', 'ABS wheel speed sensor', 55, 320000, 520000),
('Lọc dầu hộp số CVT', 'Lọc transmission CVT chuyên dụng', 35, 145000, 235000),
('Dầu hộp số tự động', 'ATF transmission fluid', 120, 95000, 155000),
('Bình ắc quy 90Ah', 'Bình điện khởi động 12V 90Ah', 18, 1450000, 2350000),
('Cảm biến mức dầu', 'Oil level sensor điện tử', 42, 380000, 620000),
('Lọc dầu turbo', 'Lọc dầu cho động cơ tăng áp', 48, 78000, 128000),
('Bugi lạnh', 'Bugi đánh lửa kiểu lạnh', 65, 32000, 55000),
('Đĩa phanh thông gió', 'Đĩa phanh có lỗ tản nhiệt', 28, 780000, 1250000),
('Cụm đèn sương mù', 'Đèn fog lamp nguyên bộ', 35, 650000, 1050000);

INSERT INTO tblService (name, description, price) VALUES
                                                      ('Thay nhớt', 'Thay dầu định kỳ', 300000),
                                                      ('Sửa phanh', 'Kiểm tra & sửa phanh xe', 500000),
                                                      ('Kiểm tra tổng quát', 'Kiểm tra toàn bộ xe', 150000),
                                                      ('Vệ sinh lọc gió', 'Vệ sinh lọc gió động cơ', 100000);

-- ===================================================
-- 3️⃣ NHẬP KHO
-- ===================================================
INSERT INTO tblSparePartReceipt (receiptDate, totalAmount, tblSupplierId, tblWarehouseStaffId) VALUES
('2025-01-05', 8500000, 1, 1),
('2025-01-12', 12800000, 2, 1),
('2025-01-20', 6750000, 3, 1),
('2025-01-28', 15200000, 4, 1),
('2025-02-03', 9300000, 5, 1),
('2025-02-10', 18500000, 6, 1),
('2025-02-18', 7200000, 7, 1),
('2025-02-25', 11900000, 8, 1),
('2025-03-05', 13400000, 9, 1),
('2025-03-12', 9800000, 10, 1),
('2025-03-20', 16700000, 11, 1),
('2025-03-28', 8900000, 12, 1),
('2025-04-05', 14300000, 13, 1),
('2025-04-12', 10500000, 14, 1),
('2025-04-20', 19200000, 15, 1),
('2025-04-28', 7800000, 16, 1),
('2025-05-05', 12100000, 17, 1),
('2025-05-12', 15800000, 18, 1),
('2025-05-20', 9400000, 19, 1),
('2025-05-28', 17600000, 20, 1),
('2025-06-05', 11200000, 21, 1),
('2025-06-12', 13900000, 22, 1),
('2025-06-20', 8600000, 23, 1),
('2025-06-28', 16400000, 24, 1),
('2025-07-05', 10800000, 25, 1),
('2025-07-12', 14700000, 26, 1),
('2025-07-20', 9100000, 27, 1),
('2025-07-28', 18300000, 28, 1),
('2025-08-05', 12500000, 29, 1),
('2025-08-12', 15100000, 30, 1),
('2025-08-20', 8800000, 31, 1),
('2025-08-28', 17200000, 32, 1),
('2025-09-05', 11600000, 33, 1),
('2025-09-12', 14200000, 34, 1),
('2025-09-20', 9700000, 35, 1),
('2025-09-28', 16900000, 36, 1),
('2025-10-05', 10300000, 37, 1),
('2025-10-12', 13700000, 38, 1),
('2025-10-20', 8400000, 39, 1),
('2025-10-28', 15600000, 40, 1),
('2025-11-05', 11800000, 41, 1),
('2025-11-12', 14900000, 42, 1),
('2025-11-20', 9500000, 43, 1),
('2025-11-28', 17800000, 44, 1),
('2025-12-05', 12300000, 45, 1),
('2025-12-12', 16100000, 46, 1),
('2025-12-20', 10600000, 47, 1),
('2025-12-28', 18900000, 48, 1),
('2024-01-08', 13200000, 49, 1),
('2024-02-15', 15400000, 50, 1),
('2024-03-22', 11400000, 1, 1),
('2024-04-18', 17100000, 2, 1),
('2024-05-25', 9900000, 3, 1),
('2024-06-10', 14600000, 4, 1),
('2024-07-15', 12700000, 5, 1),
('2024-08-20', 16300000, 6, 1),
('2024-09-12', 10900000, 7, 1),
('2024-10-18', 15900000, 8, 1),
('2024-11-22', 13100000, 9, 1);

INSERT INTO tblSparePartReceiptDetail (quantity, totalPrice, tblSparePartReceiptId, tblSparePartId) VALUES
-- Receipt 1
(50, 2250000, 1, 1), (20, 7600000, 1, 2), (30, 540000, 1, 3),
-- Receipt 2
(40, 1800000, 2, 4), (35, 1925000, 2, 5), (60, 10800000, 2, 6),
-- Receipt 3
(15, 12750000, 3, 7), (25, 10500000, 3, 8), (45, 1710000, 3, 9),
-- Receipt 4
(30, 2550000, 4, 10), (28, 8960000, 4, 11), (35, 2625000, 4, 12),
-- Receipt 5
(40, 2600000, 5, 13), (55, 6600000, 5, 14), (18, 11700000, 5, 15),
-- Receipt 6
(22, 3960000, 6, 16), (48, 2304000, 6, 17), (25, 1375000, 6, 18),
-- Receipt 7
(16, 9280000, 7, 19), (12, 22200000, 7, 20), (20, 5600000, 7, 21),
-- Receipt 8
(25, 2375000, 8, 22), (70, 2450000, 8, 23), (10, 8500000, 8, 24),
-- Receipt 9
(35, 13300000, 9, 25), (18, 2250000, 9, 26), (38, 836000, 9, 27),
-- Receipt 10
(14, 6720000, 10, 28), (11, 18150000, 10, 29), (24, 7680000, 10, 30),
-- Receipt 11
(28, 2380000, 11, 31), (52, 7540000, 11, 32), (16, 13600000, 11, 33),
-- Receipt 12
(32, 4640000, 12, 34), (22, 6930000, 12, 35), (26, 1014000, 12, 36),
-- Receipt 13
(19, 12350000, 13, 37), (33, 4290000, 13, 38), (29, 12180000, 13, 39),
-- Receipt 14
(25, 2000000, 14, 40), (41, 3567000, 14, 41), (17, 8160000, 14, 42),
-- Receipt 15
(23, 12650000, 15, 43), (15, 4275000, 15, 44), (36, 2808000, 15, 45),
-- Receipt 16
(27, 1566000, 16, 46), (19, 10450000, 16, 47), (31, 8990000, 16, 48),
-- Receipt 17
(21, 8820000, 17, 49), (34, 19380000, 17, 50), (26, 2418000, 17, 51),
-- Receipt 18
(18, 10440000, 18, 52), (28, 7980000, 18, 53), (24, 8640000, 18, 54),
-- Receipt 19
(30, 11400000, 19, 55), (20, 1360000, 19, 56), (22, 1716000, 19, 57),
-- Receipt 20
(16, 9280000, 20, 58), (25, 23750000, 20, 1), (19, 7220000, 20, 2),
-- Receipt 21
(33, 1485000, 21, 3), (28, 2660000, 21, 4), (24, 1320000, 21, 5),
-- Receipt 22
(17, 3060000, 22, 6), (26, 22100000, 22, 7), (31, 13020000, 22, 8),
-- Receipt 23
(22, 836000, 23, 9), (29, 2465000, 23, 10), (18, 5760000, 23, 11),
-- Receipt 24
(20, 1500000, 24, 12), (35, 2275000, 24, 13), (27, 3240000, 24, 14),
-- Receipt 25
(14, 9100000, 25, 15), (23, 4140000, 25, 16), (32, 1536000, 25, 17),
-- Receipt 26
(19, 1045000, 26, 18), (25, 14500000, 26, 19), (21, 34650000, 26, 20),
-- Receipt 27
(28, 7840000, 27, 21), (16, 1520000, 27, 22), (24, 840000, 27, 23),
-- Receipt 28
(12, 10200000, 28, 24), (31, 11780000, 28, 25), (26, 910000, 28, 26),
-- Receipt 29
(22, 1540000, 29, 27), (18, 8640000, 29, 28), (27, 44550000, 29, 29),
-- Receipt 30
(15, 4800000, 30, 30), (29, 2465000, 30, 31), (23, 3335000, 30, 32),
-- Receipt 31
(20, 1700000, 31, 33), (34, 29240000, 31, 34), (19, 12350000, 31, 35),
-- Receipt 32
(25, 1050000, 32, 36), (17, 11560000, 32, 37), (30, 13500000, 32, 38),
-- Receipt 33
(21, 9450000, 33, 39), (28, 35840000, 33, 40), (24, 6840000, 33, 41),
-- Receipt 34
(16, 2000000, 34, 42), (26, 2210000, 34, 43), (31, 14260000, 34, 44),
-- Receipt 35
(19, 14820000, 35, 45), (22, 12760000, 35, 46), (27, 11340000, 35, 47),
-- Receipt 36
(18, 8640000, 36, 48), (25, 32000000, 36, 49), (23, 29440000, 36, 50),
-- Receipt 37
(20, 2500000, 37, 51), (29, 2465000, 37, 52), (24, 2040000, 37, 53),
-- Receipt 38
(15, 27750000, 38, 54), (28, 23800000, 38, 55), (21, 1428000, 38, 56),
-- Receipt 39
(17, 1326000, 39, 57), (26, 15080000, 39, 58), (22, 3410000, 39, 1),
-- Receipt 40
(19, 11780000, 40, 2), (24, 3480000, 40, 3), (28, 4060000, 40, 4),
-- Receipt 41
(16, 880000, 41, 5), (31, 5580000, 41, 6), (23, 19550000, 41, 7),
-- Receipt 42
(20, 8400000, 42, 8), (27, 1755000, 42, 9), (25, 2125000, 42, 10),
-- Receipt 43
(18, 5760000, 43, 11), (22, 1650000, 43, 12), (29, 1885000, 43, 13),
-- Receipt 44
(15, 1800000, 44, 14), (26, 16900000, 44, 15), (30, 8700000, 44, 16),
-- Receipt 45
(21, 1008000, 45, 17), (28, 1540000, 45, 18), (24, 13920000, 45, 19),
-- Receipt 46
(17, 28050000, 46, 20), (23, 6440000, 46, 21), (31, 4495000, 46, 22),
-- Receipt 47
(19, 665000, 47, 23), (25, 21250000, 47, 24), (27, 10260000, 47, 25),
-- Receipt 48
(16, 2240000, 48, 26), (29, 1972000, 48, 27), (22, 12760000, 48, 28),
-- Receipt 49
(20, 33000000, 49, 29), (26, 9880000, 49, 30), (24, 3432000, 49, 31),
-- Receipt 50
(18, 2880000, 50, 32), (30, 4350000, 50, 33), (23, 29900000, 50, 34),
-- Receipt 51
(21, 3255000, 51, 35), (27, 2106000, 51, 36), (25, 14500000, 51, 37),
-- Receipt 52
(19, 20900000, 52, 38), (28, 8960000, 52, 39), (22, 25080000, 52, 40),
-- Receipt 53
(17, 5236000, 53, 41), (24, 11520000, 53, 42), (31, 16120000, 53, 43),
-- Receipt 54
(20, 25600000, 54, 44), (26, 9880000, 54, 45), (23, 1334000, 54, 46),
-- Receipt 55
(18, 10440000, 55, 47), (29, 22620000, 55, 48), (25, 7950000, 55, 49),
-- Receipt 56
(16, 20480000, 56, 50), (27, 8640000, 56, 51), (22, 3190000, 56, 52),
-- Receipt 57
(21, 3045000, 57, 53), (30, 42300000, 57, 54), (24, 13680000, 57, 55),
-- Receipt 58
(19, 6156000, 58, 56), (25, 1450000, 58, 57), (28, 21840000, 58, 58),
-- Receipt 59
(17, 17850000, 59, 1), (26, 16120000, 59, 2), (23, 736000, 59, 3);

-- ===================================================
-- 4️⃣ GIAO DỊCH DOANH THU
-- ===================================================

-- Hóa đơn 1
INSERT INTO tblInvoice (id, invoiceDate, totalAmount, tblCustomerId, tblSalesStaffId)
VALUES (1, '2025-10-20', 1230000, 1, 2);
INSERT INTO tblRequest (id, type, description, requestDate, status, tblCustomerId, tblInvoiceId, tblSalesStaffId)
VALUES (1, 'Repair', 'Sửa phanh & thay lọc dầu', '2025-10-19', 'Completed', 1, 1, 2);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 1, 2, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 1, 1), (1, 1, 2);

-- Hóa đơn 2
INSERT INTO tblInvoice VALUES (2, '2025-10-23', 370000, 5, 12);
INSERT INTO tblRequest VALUES (2, 'Maintenance', 'Thay nhớt + bugi', '2025-10-22', 'Completed', 5, 2, 12);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 2, 1, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (2, 2, 3);

-- Hóa đơn 3
INSERT INTO tblInvoice VALUES (3, '2025-10-26', 150000, 7, 2);
INSERT INTO tblRequest VALUES (3, 'Inspection', 'Kiểm tra tổng quát', '2025-10-26', 'Completed', 7, 3, 2);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 3, 3, 4);

-- Hóa đơn 4
INSERT INTO tblInvoice VALUES (4, '2025-10-27', 255000, 8, 13);
INSERT INTO tblRequest VALUES (4, 'Purchase', 'Mua phụ tùng thay thế', '2025-10-27', 'Completed', 8, 4, 13);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (3, 4, 3), (1, 4, 4);

-- Hóa đơn 5
INSERT INTO tblInvoice VALUES (5, '2025-10-28', 600000, 9, 2);
INSERT INTO tblRequest VALUES (5, 'Maintenance', 'Thay nhớt 2 xe', '2025-10-28', 'Completed', 9, 5, 2);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (2, 5, 1, 4);

-- Hóa đơn 6
INSERT INTO tblInvoice VALUES (6, '2025-10-29', 650000, 1, 12);
INSERT INTO tblRequest VALUES (6, 'Purchase', 'Mua má phanh', '2025-10-29', 'Completed', 1, 6, 12);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 6, 2);

-- Hóa đơn 7
INSERT INTO tblInvoice VALUES (7, '2025-10-30', 580000, 8, 13);
INSERT INTO tblRequest VALUES (7, 'Repair', 'Sửa phanh + thay lọc dầu', '2025-10-30', 'Completed', 8, 7, 13);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 7, 2, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 7, 1);

-- Hóa đơn 8
INSERT INTO tblInvoice VALUES (8, '2025-10-31', 185000, 10, 12);
INSERT INTO tblRequest VALUES (8, 'Repair', 'Thay bugi + kiểm tra', '2025-10-31', 'Completed', 10, 8, 12);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 8, 3, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 8, 3);

-- Hóa đơn 9
INSERT INTO tblInvoice VALUES (9, '2025-11-01', 880000, 6, 13);
INSERT INTO tblRequest VALUES (9, 'Maintenance', 'Thay nhớt + sửa phanh', '2025-11-01', 'Completed', 6, 9, 13);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 9, 1, 4), (1, 9, 2, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 9, 1);

-- Hóa đơn 10
INSERT INTO tblInvoice VALUES (10, '2025-11-02', 180000, 5, 2);
INSERT INTO tblRequest VALUES (10, 'Maintenance', 'Vệ sinh lọc gió + thay lọc dầu', '2025-11-02', 'Completed', 5, 10, 2);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 10, 4, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 10, 1);


-- Hóa đơn 11 
INSERT INTO tblInvoice VALUES (11, '2025-10-25', 880000, 7, 12);
INSERT INTO tblRequest VALUES (11, 'Repair', 'Sửa phanh + thay dầu', '2025-10-25', 'Completed', 7, 11, 12);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 11, 1, 4), (1, 11, 2, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 11, 1);

-- Hóa đơn 12
INSERT INTO tblInvoice VALUES (12, '2025-11-03', 150000, 9, 13);
INSERT INTO tblRequest VALUES (12, 'Inspection', 'Kiểm tra xe định kỳ', '2025-11-03', 'Completed', 9, 12, 13);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 12, 3, 4);

-- Hóa đơn 13
INSERT INTO tblInvoice VALUES (13, '2025-11-10', 400000, 1, 2);
INSERT INTO tblRequest VALUES (13, 'Maintenance', 'Thay nhớt + vệ sinh lọc gió', '2025-11-10', 'Completed', 1, 13, 2);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 13, 1, 4), (1, 13, 4, 4);

-- Hóa đơn 14 - Giữa tháng 11
INSERT INTO tblInvoice VALUES (14, '2025-11-15', 1150000, 5, 12);
INSERT INTO tblRequest VALUES (14, 'Repair', 'Sửa phanh + thay má phanh', '2025-11-15', 'Completed', 5, 14, 12);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 14, 2, 4);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (1, 14, 2);

-- Hóa đơn 15
INSERT INTO tblInvoice VALUES (15, '2025-11-25', 300000, 8, 13);
INSERT INTO tblRequest VALUES (15, 'Maintenance', 'Thay nhớt định kỳ', '2025-11-25', 'Completed', 8, 15, 13);
INSERT INTO tblServiceRequest (quantity, tblRequestId, tblServiceId, tblTechnicalStaffId)
VALUES (1, 15, 1, 4);

-- Hóa đơn 16
INSERT INTO tblInvoice VALUES (16, '2025-11-29', 160000, 6, 2);
INSERT INTO tblRequest VALUES (16, 'Purchase', 'Mua phụ tùng lọc dầu', '2025-11-29', 'Completed', 6, 16, 2);
INSERT INTO tblSparePartRequest (quantity, tblRequestId, tblSparePartId)
VALUES (2, 16, 1);

SET FOREIGN_KEY_CHECKS = 1;
