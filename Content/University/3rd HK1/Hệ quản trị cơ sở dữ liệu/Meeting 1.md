#### các vấn đề cần giải quyết: 
##### thiết kế database: các tảng, các đối tượng đã ổn chưa ?
đề xuất: 
- thêm bảng NHANVIEN MaNV (PK) HoTen NgaySinh GioiTinh SDT DiaChi ChucVu TrangThai
- ở bảng LICHKHAM: bỏ lí do khám (vô khám rồi bs mới hỏi), gộp ngày khám và giờ khám lại thành kiểu dữ liệu DATETIME (gồm cả ngày và giờ), thêm thời gian khám dự kiến (vd 30p) (để thực hiện tính năng trùng lịch khám), 
- ở LICHKHAM và PHIEUKHAM có cả hai cột là ngaykham, nên đặt thành ngayhen và ngaykhamthucte
- ở HOADON: tại sao cần MaPK ?
- ở THUOC: nên thêm trạng thái, vì thuốc có thể hết 
- ở CT_THUOC nên thêm DONGIA vì giá thuốc có thể thay đổi, THUOC.DONGIA = giá thuốc hiện tại, CT_THUOC.DONGIA = giá thuốc lúc được kê 

##### View 

##### Stored Procedure

##### Indexes 

##### Transaction 

##### Role 
| Function                   | Admin | Doctor       | Receptionist | Cashier |
| -------------------------- | ----- | ------------ | ------------ | ------- |
| Manage employees           | CRUD  | ❌            | ❌            | ❌       |
| Manage doctors             | CRUD  | Read         | Read         | Read    |
| Manage specialties         | CRUD  | Read         | Read         | Read    |
| Manage patients            | CRUD  | Read/Update  | CRUD         | Read    |
| Create appointments        | ✅     | ❌            | ✅            | ❌       |
| Update appointment status  | ✅     | ✅            | ✅            | ❌       |
| View appointments          | ✅     | Own patients | ✅            | ❌       |
| View appointments          | ✅     | Own patients | ✅            | ❌       |
| Create examination records | ✅     | ✅            | ❌            | ❌       |
| Update diagnosis           | ✅     | ✅            | ❌            | ❌       |
| Create prescriptions       | ✅     | ✅            | ❌            | ❌       |
| Manage medicines           | CRUD  | Read         | ❌            | ❌       |
| Assign medical services    | ✅     | ✅            | ❌            | ❌       |
| Manage service catalog     | CRUD  | Read         | Read         | Read    |
| View invoices              | ✅     | Read         | Read         | ✅       |
| Create invoice             | ✅     | ❌            | ❌            | ✅       |
| Process payment            | ✅     | ❌            | ❌            | ✅       |
| View payment history       | ✅     | ❌            | ❌            | ✅       |
| System/user management     | ✅     | ❌            | ❌            | ❌       |

