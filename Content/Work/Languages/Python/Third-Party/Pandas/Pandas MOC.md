# Pandas MOC (Map of Content)

Chào mừng bạn đến với tài liệu hướng dẫn học và tra cứu thư viện Pandas. Dưới đây là mục lục liên kết đến các phần nội dung chi tiết:

## 1. Thành phần cơ bản (Core Objects)
* [[DataFrame]] - Cấu trúc dữ liệu dạng bảng 2 chiều.
* [[Series]] - Cấu trúc dữ liệu dạng mảng 1 chiều (cột hoặc hàng).

## 2. Đọc và tải dữ liệu (Data Loading)
* [[read_csv()]] - Đọc dữ liệu từ file csv.
* [[read_json()]] - Đọc dữ liệu từ file json.

## 3. DataFrame Attributes (Thuộc tính)
* [[loc]] - Truy xuất dữ liệu theo nhãn (label).
* [[iloc]] - Truy xuất dữ liệu theo chỉ số nguyên (integer position).

## 4. DataFrame Methods (Phương thức)

### Xử lý & Biến đổi dữ liệu (Manipulation)
* [[apply()]] - Áp dụng một hàm tự định nghĩa lên các hàng hoặc cột.
* [[dropna()]] - Xóa các hàng hoặc cột có giá trị rỗng (NaN).
* [[fillna()]] - Thay thế các giá trị rỗng (NaN) bằng giá trị chỉ định.

### Thống kê & Thông tin (Stat & Info)
* [[info()]] - Xem thông tin tổng quan về DataFrame.
* [[describe()]] - Thống kê mô tả các đặc trưng số/chuỗi.
* [[head()]] - Lấy các hàng đầu tiên của bảng.
* [[tail()]] - Lấy các hàng cuối cùng của bảng.
* [[mean()]] - Tính giá trị trung bình.
* [[median()]] - Tính giá trị trung vị.
* [[mode()]] - Tìm giá trị xuất hiện nhiều nhất.

## 5. Series Methods
* [[unique()]] - Lấy mảng chứa các giá trị riêng biệt.
* [[nunique()]] - Đếm số lượng các giá trị riêng biệt.

## 6. Hướng dẫn & Recipes
* [[cách duyệt qua các phần tử trong cột]] - Các phương pháp duyệt qua phần tử và cách tối ưu hiệu năng.
