# NumPy MOC (Map of Content)

## 1. Thuộc tính của Mảng (Array Attributes)
- [[shape]] - Kích thước/hình dạng của mảng (đối với ma trận 2D: chiều cao, chiều rộng)
- [[ndim]] - Số chiều của mảng
- [[size]] - Tổng số phần tử trong mảng
- [[dtype]] - Kiểu dữ liệu của các phần tử
- [[itemsize]] - Kích thước (byte) của mỗi phần tử
- [[nbytes]] - Tổng kích thước (byte) của mảng

## 2. Khởi tạo Mảng (Array Creation)
- [[array()]] - Tạo mảng từ list/tuple
- [[arrange()]] - Tạo mảng với các phần tử cách đều (arange)
- [[linspace()]] - Tạo mảng với số lượng phần tử cách đều nhau trong khoảng
- [[zeros()]] - Tạo mảng chứa toàn số 0
- [[ones()]] - Tạo mảng chứa toàn số 1
- [[full()]] - Tạo mảng chứa toàn một giá trị chỉ định
- [[full_like()]] - Tạo mảng có shape giống mảng khác, chứa toàn giá trị chỉ định
- [[identity()]] - Tạo ma trận đơn vị
- [[eye()]] - Tạo ma trận đường chéo
- [[empty()]] - Tạo mảng rỗng (giá trị rác)

## 3. Tạo Số ngẫu nhiên (Random)
- [[random.rand()]] - Tạo mảng số thực ngẫu nhiên từ 0 đến 1
- [[random.random_sample()]] - Tạo mảng số thực ngẫu nhiên [0.0, 1.0)
- [[random.randint()]] - Tạo mảng số nguyên ngẫu nhiên trong khoảng

## 4. Chỉ mục & Cắt mảng (Indexing & Slicing)
- [[truy cập một phần tử cụ thể]] - Cách truy cập phần tử trong mảng
- [[integer array indexing]] - Chỉ mục bằng mảng số nguyên
- [[boolean array indexing]] - Chỉ mục bằng mảng boolean (lọc điều kiện)

## 5. Biến đổi Mảng (Array Manipulation)
- [[reshape()]] - Thay đổi hình dạng mảng
- [[flatten()]] - Làm phẳng mảng thành 1 chiều
- [[transpose()]] - Chuyển vị mảng
- [[ma trận chuyển vị]] - Khái niệm/hình ảnh về ma trận chuyển vị
- [[repeat()]] - Lặp lại các phần tử của mảng
- [[astype()]] - Chuyển đổi kiểu dữ liệu mảng
- [[np.uint8]] - Kiểu dữ liệu số nguyên không dấu 8-bit

## 6. Liên kết & Tách mảng (Joining & Splitting)
- [[vstack()]] - Ghép các mảng theo chiều dọc (vertical stack)
- [[hstack()]] - Ghép các mảng theo chiều ngang (horizontal stack)

## 7. Phép toán & Đại số tuyến tính (Operations & Linear Algebra)
- [[broadcasting]] - Cơ chế lan truyền khi tính toán khác kích thước
- [[clip()]] - Giới hạn các giá trị trong mảng khoảng [min, max]
- [[dot]] - Phép nhân dot product / nhân ma trận
- [[dot()]] - Hàm tính dot product
- [[matmul()]] - Nhân hai ma trận
- [[nhân ma trận]] - Phép nhân ma trận
- [[nhân vô hướng]] - Phép nhân vô hướng (scalar multiplication)
- [[trace()]] - Tính tổng các phần tử trên đường chéo chính

### Đại số tuyến tính nâng cao (Linear Algebra - `linalg`)
- [[linalg/Vectorization|Vectorization]] - Vectơ hóa các phép toán
- [[linalg/linalg.det()|linalg.det()]] - Tính định thức của ma trận
- [[linalg/linalg.inv()|linalg.inv()]] - Tìm ma trận nghịch đảo
- [[linalg/linalg.norm()|linalg.norm()]] - Tính chuẩn (norm) của vectơ/ma trận
- [[linalg/linalg.solve()|linalg.solve()]] - Giải hệ phương trình tuyến tính

## 8. Tìm kiếm, Sắp xếp & Thống kê (Searching & Statistics)
- [[sum()]] - Tính tổng các phần tử
- [[mean()]] - Tính giá trị trung bình
- [[min()]] - Tìm giá trị nhỏ nhất
- [[argmax()]] - Tìm chỉ số của phần tử lớn nhất
- [[argmin()]] - Tìm chỉ số của phần tử nhỏ nhất
- [[where()]] - Lọc phần tử theo điều kiện
