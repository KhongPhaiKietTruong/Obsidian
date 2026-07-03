# Math for AI MOC

Chào mừng bạn đến với Bản đồ nội dung (MOC) về **Toán học cho AI (Math for AI)**. Đây là nơi lưu trữ và điều hướng toàn bộ các kiến thức toán học cốt lõi phục vụ cho Machine Learning và Deep Learning.

---

## 📐 1. Đại số tuyến tính (Linear Algebra)
Đại số tuyến tính cung cấp ngôn ngữ và công cụ để biểu diễn, thao tác dữ liệu nhiều chiều.

### 🧱 Các đối tượng cơ bản
- [[Scalar]] (Vô hướng): Giá trị số đơn lẻ.
- [[Vector]] (Véc-tơ): Mảng số 1 chiều đại diện cho hướng và độ lớn.
- [[Matrix]] (Ma trận): Mảng số 2 chiều.

### ➕ Phép toán trên Vector & Ma trận
- **Phép toán Vector**:
  - [[Vector addition]] & [[Vector subtraction]]: Phép cộng và trừ véc-tơ.
  - [[Vector multiplication]]: Phép nhân véc-tơ với vô hướng.
  - [[Dot product]]: Tích vô hướng của hai véc-tơ (trả về một vô hướng).
  - [[Cross product]]: Tích có hướng của hai véc-tơ (trả về một véc-tơ vuông góc).
  - [[Hadamard product]]: Tích Hadamard (nhân từng phần tử tương ứng).
- **Phép toán Ma trận**:
  - [[Matrix operations/Matrix subtraction|Matrix subtraction]]: Phép trừ ma trận.
  - [[Matrix operations/Matrix multiplication|Matrix multiplication]]: Phép nhân ma trận.

### 🏛️ Không gian Vector & Tính chất tuyến tính
- [[Linear combination]] (Tổ hợp tuyến tính): Biểu diễn véc-tơ dưới dạng tổng tuyến tính của các véc-tơ khác.
- [[Span]] (Không gian sinh): Tập hợp tất cả các tổ hợp tuyến tính khả dĩ.
- [[Linear Independency]] & [[Linear dependence]]: Độc lập tuyến tính và Phụ thuộc tuyến tính.
- [[Basis]] (Cơ sở): Tập hợp các véc-tơ độc lập tuyến tính sinh ra không gian vector.

### 🔲 Hệ phương trình & Các dạng ma trận đặc biệt
- [[Linear equation]]: Phương trình tuyến tính.
- [[Augmented matrix]]: Ma trận mở rộng biểu diễn hệ phương trình.
- [[Row echelon form]] & [[Reduced row echelon form]]: Dạng bậc thang và Dạng bậc thang rút gọn.
- [[Identity matrix]]: Ma trận đơn vị $I$.
- [[Inverse matrix]]: Ma trận nghịch đảo $A^{-1}$.
- [[Non-singular matrix]] & [[Singular matrix]]: Ma trận không suy biến (có nghịch đảo) và Ma trận suy biến (không nghịch đảo).
- [[Determinant]]: Định thức của ma trận.
  - [[Determinant of a product]]: Định thức của tích các ma trận.
- [[Null space ( kernel )]]: Không gian hạt nhân (nghiệm của phương trình $Ax = 0$).
- [[Solution space]]: Không gian nghiệm của hệ phương trình tuyến tính.
- [[Rank]]: Hạng của ma trận (số hàng/cột độc lập tuyến tính tối đa).

### 📏 Chuẩn (Norms)
- [[Norm of a matrix]]: Chuẩn của ma trận.
- [[L1-norm]]: Chuẩn Manhattan (tổng trị tuyệt đối các phần tử).
- [[L2-norm]]: Chuẩn Euclidean (căn bậc hai tổng bình phương).

### 🔄 Trị riêng, Véc-tơ riêng & Ứng dụng
- [[Eigenvalue]] & [[Eigenvector]]: Trị riêng và véc-tơ riêng của ma trận vuông.
- [[Eigenbasis]]: Cơ sở gồm các véc-tơ riêng.
- [[Covariance matrix]]: Ma trận hiệp phương sai.
- [[PCA]]: Phân tích thành phần chính (Principal Component Analysis) ứng dụng giảm chiều dữ liệu.

---

## 📈 2. Giải tích (Calculus)
Giải tích là nền tảng cho việc tối ưu hóa các mô hình học máy thông qua việc tính toán độ dốc và đạo hàm.

### ✍️ Đạo hàm & Quy tắc đạo hàm
- [[Derivative's notation]]: Ký hiệu đạo hàm.
- [[Partial Derivative]]: Đạo hàm riêng theo từng biến trong hàm nhiều biến.
- **Quy tắc đạo hàm**:
  - [[The chain rule]]: Quy tắc chuỗi (cho hàm hợp).
  - [[The product rule]]: Quy tắc đạo hàm của tích.
  - [[The sum rule]]: Quy tắc đạo hàm của tổng.
  - [[The scalar rule]]: Quy tắc nhân với hằng số vô hướng.

### 🎯 Tối ưu hóa (Optimization)
- [[Gradient]]: Vector chứa các đạo hàm riêng, chỉ hướng tăng nhanh nhất của hàm số.
- [[Gradient descent]]: Thuật toán cực tiểu hóa độ dốc - thuật toán tối ưu hóa cốt lõi trong ML/DL.
- [[Newton's method]]: Phương pháp Newton để tìm nghiệm hoặc tối ưu hóa.
- [[Convex Function]]: Hàm lồi (mọi cực trị địa phương đều là cực trị toàn cục).
- [[Local Minimum]] & [[Global Minimum]]: Cực tiểu cục bộ và Cực tiểu toàn cục.
- [[Contour Plot]]: Biểu đồ đường đồng mức để trực quan hóa hàm số nhiều biến.

---

## 🎲 3. Xác suất (Probability)
Xác suất giúp mô hình hóa sự không chắc chắn (uncertainty) trong dữ liệu và mô hình.

### 🧩 Khái niệm cơ bản & Quy tắc xác suất
- [[Probability]]: Xác suất của một sự kiện xảy ra.
- [[Experiment]]: Phép thử ngẫu nhiên.
- [[Sample space]]: Không gian mẫu của phép thử.
- [[Bayes theorem/Event|Event]]: Biến cố.
- **Quy tắc tính xác suất**:
  - [[Complement of probability]]: Xác suất của biến cố đối.
  - [[Sum of probabilities]]: Quy tắc cộng xác suất.
  - [[Product rule]]: Quy tắc nhân xác suất.
  - [[Conditional probability]]: Xác suất có điều kiện.
  - [[Independent events]]: Các biến cố độc lập.
  - [[Disjoint events (mutually exclusive)]]: Các biến cố xung khắc (không đồng thời xảy ra).
  - [[Joint events (non-mutually exclusive)]]: Các biến cố không xung khắc.

### 📐 Định lý Bayes
- [[Bayes's theorem]]: Định lý Bayes tính xác suất hậu nghiệm.
  - [[Prior]]: Xác suất tiên nghiệm (trước khi có dữ liệu mới).
  - [[Posterior]]: Xác suất hậu nghiệm (sau khi đã cập nhật dữ liệu mới).
  - [[Naive assumption]]: Giả định ngây thơ về tính độc lập của các đặc trưng (dùng trong Naive Bayes).

### 📊 Biến ngẫu nhiên & Các hàm phân phối
- [[Random variable]]: Biến ngẫu nhiên.
  - [[Discrete random variable]]: Biến ngẫu nhiên rời rạc.
  - [[Continuous random variable]]: Biến ngẫu nhiên liên tục.
- **Hàm đặc trưng**:
  - [[Probability mass function (PMF)]]: Hàm khối xác suất (cho biến rời rạc).
  - [[Probability density function (PDF)]]: Hàm mật độ xác suất (cho biến liên tục).
  - [[Cumulative distribution function]]: Hàm phân phối tích lũy (CDF).
- **Các phân phối xác suất phổ biến**:
  - [[Uniform distribution]]: Phân phối đều.
  - [[Binomial distribution]]: Phân phối nhị thức.
  - [[Normal distribution (Gaussian distribution)]]: Phân phối chuẩn (Gauss).
    - [[Sum of Gaussian]]: Tổng các phân phối chuẩn độc lập cũng là phân phối chuẩn.
- **Phân phối đồng thời (Joint Distribution)**:
  - [[Joint distribution]]: Phân phối đồng thời của nhiều biến ngẫu nhiên.
  - [[Marginal distribution]]: Phân phối biên.
  - [[Conditional distribution]]: Phân phối có điều kiện.

### 📉 Các đặc trưng phân phối (Measures / Moments)
- [[Moments of a distribution]]: Các momen của phân phối xác suất.
- [[Expected value]]: Kỳ vọng (giá trị trung bình dài hạn).
- [[Variance]] & [[Standard deviation]]: Phương sai và Độ lệch chuẩn (đo lường độ phân tán của dữ liệu).
- [[Median value]]: Trung vị.
- [[Mode value]]: Yếu vị (giá trị xuất hiện nhiều nhất).
- [[Quantile]] & [[Interquartile range]]: Phân vị và khoảng tứ phân vị.
- [[Skewness]] & [[Kurtosis]]: Độ lệch (độ xiên) và độ nhọn của phân phối.
- [[Covariance]] & [[Correlation coefficient]]: Hiệp phương sai và Hệ số tương quan (độ liên hệ tuyến tính giữa hai biến).
- [[Binomial coefficient]]: Hệ số nhị thức.
- [[Standardization (Z-score normalization )]]: Kỹ thuật chuẩn hóa đưa dữ liệu về phân phối chuẩn hóa có trung bình bằng 0 và độ lệch chuẩn bằng 1.

---

## 📊 4. Thống kê (Statistics)
Thống kê cung cấp các phương pháp để phân tích, diễn giải dữ liệu thu thập được từ các mẫu.

### 👥 Khái niệm mẫu & Quần thể
- [[Population]]: Quần thể (tập hợp toàn bộ các đối tượng nghiên cứu).
- [[Sample]]: Mẫu (tập con được chọn ra từ quần thể).

### 📈 Đặc trưng mẫu & Ước lượng khoảng
- **Đặc trưng mẫu**:
  - [[Sample mean]]: Trung bình mẫu.
  - [[Sample proportion]]: Tỷ lệ mẫu.
  - [[Sample Variance]]: Phương sai mẫu.
  - [[Sample Standard Deviation]]: Độ lệch chuẩn mẫu.
  - [[Population Standard Deviation]]: Độ lệch chuẩn quần thể.
- **Ước lượng**:
  - [[Standard Error (SE)]]: Sai số chuẩn (đo lường độ biến động của đặc trưng mẫu).
  - [[Margin Of Error (ME)]]: Sai số biên.
  - [[Confidence Interval]]: Khoảng tin cậy cho tham số quần thể.

### 🧪 Phép kiểm định giả thuyết (Hypothesis Testing)
- [[Null Hypothesis]]: Giả thuyết không ($H_0$).
- [[Alternative Hypothesis]]: Giả thuyết đối ($H_a$).
- [[Significance Level]]: Mức ý nghĩa $\alpha$.
- [[Critical Value]]: Giá trị tới hạn xác định ranh giới bác bỏ $H_0$.
- [[P-value]]: Xác suất quan sát được dữ liệu cực đoan như vậy nếu $H_0$ đúng.
- **Hướng kiểm định**:
  - [[Left-tailed Hypothesis]] & [[Right-tailed Hypothesis]]: Kiểm định một đuôi (đuôi trái/phải).
  - [[Two-tailed Hypothesis]]: Kiểm định hai đuôi.
- **Sai lầm trong kiểm định**:
  - [[Type I Error (False Positive)]]: Sai lầm loại I (bác bỏ $H_0$ khi nó đúng).
  - [[Type II Error (False Negative)]]: Sai lầm loại II (không bác bỏ $H_0$ khi nó sai).
    - [[Type II Error Probability]]: Xác suất xảy ra sai lầm loại II ($\beta$).
  - [[Power of the test]]: Lực lượng kiểm định ($1 - \beta$).
- **Phương pháp kiểm định & Phân phối liên quan**:
  - [[Student's t-distribution]]: Phân phối t Student.
    - [[Degree Of Freedom]]: Bậc tự do.
  - [[T-test]] & [[Two-Sample T-test]]: Kiểm định T-test một mẫu và hai mẫu.
  - [[Z-score (standard score)]] & [[T-score]]: Điểm Z và Điểm T.
  - [[Central Limit Theorem (CLT)]]: Định lý giới hạn trung tâm.
- **Ước lượng tham số**:
  - [[MLE (Maximum Likelihood Estimation)]]: Ước lượng hợp lý cực đại.
  - [[MAP (Maximum A Posterior)]]: Ước lượng cực đại hậu nghiệm.
- **Ứng dụng**:
  - [[AB testing (Split testing)]]: Thử nghiệm A/B trong môi trường thực tế.

---

## 🧮 5. Các chủ đề Toán học khác (Math)
- [[Cosine similarity]]: Độ tương đồng Cosine (đo góc giữa hai véc-tơ).
- [[Euclidean]]: Khoảng cách hình học Euclidean.
- [[Mean value (Average value)]]: Giá trị trung bình.
