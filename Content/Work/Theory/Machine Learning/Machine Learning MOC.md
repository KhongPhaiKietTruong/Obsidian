# Machine Learning MOC

Chào mừng bạn đến với Bản đồ nội dung (MOC) về **Machine Learning (Học máy)**. Đây là nơi lưu trữ và điều hướng toàn bộ các kiến thức nền tảng, các thành phần của mô hình, và các khái niệm cốt lõi trong thư mục này.

---

## 🤖 1. Nền tảng Học máy (Foundations)
Các khái niệm và phương pháp luận cơ bản trong Machine Learning:

### 📖 Tổng quan & Quy trình huấn luyện
- **[[Supervised Learning]]** (Học có giám sát): Học từ dữ liệu đã được gán nhãn.
- **[[Unsupervised Learning]]** (Học không giám sát): Tìm cấu trúc ẩn trong dữ liệu không nhãn.
- **Dữ liệu & Giả thuyết**:
  - [[Training Set]]: Tập dữ liệu dùng để huấn luyện mô hình.
  - [[Features]] & [[Features Selection]]: Các đặc trưng dữ liệu và cách lựa chọn đặc trưng.
  - [[Feature Scaling]]: Kỹ thuật chuẩn hóa/co giãn đặc trưng.
  - [[Target variable]]: Biến mục tiêu (nhãn) cần dự đoán.
  - [[Hypothesis]]: Giả thuyết/Mô hình toán học xấp xỉ hàm mục tiêu.
  - [[Predicted Value]]: Giá trị dự đoán đầu ra của mô hình.
  - [[The Error]]: Sai số giữa giá trị dự đoán và thực tế.
  - [[Generalization]]: Khả năng tổng quát hóa trên dữ liệu mới chưa từng thấy.

### 📈 Học có giám sát (Supervised Learning)
- **[[Regression]]** (Hồi quy): Dự đoán giá trị liên tục.
  - [[Linear Regression]]: Hồi quy tuyến tính - mô hình hồi quy cơ bản nhất.
- **[[Classification]]** (Phân loại): Dự đoán nhãn danh mục/rời rạc.
  - [[Logistic Regression]]: Hồi quy Logistic - mô hình phân loại nhị phân phổ biến.
  - [[Decision Boundary]]: Ranh giới quyết định phân tách các phân lớp.

### 🔍 Học không giám sát (Unsupervised Learning)
- **[[Clustering]]** (Phân cụm): Nhóm các điểm dữ liệu tương tự lại với nhau.

### ⚖️ Đánh giá & Tối ưu hóa mô hình
- **Vấn đề Overfitting & Underfitting**:
  - [[Overfitting]] (Quá khớp): Mô hình quá khớp với dữ liệu huấn luyện, mất khả năng tổng quát.
    - [[Addressing Overfitting]]: Các phương pháp giải quyết quá khớp.
  - [[Underfitting]] (Chưa khớp): Mô hình quá đơn giản, không học được cấu trúc dữ liệu.
  - [[Regularization]]: Kỹ thuật chính quy hóa (L1, L2) giúp giảm overfitting.
  - [[Bias]]: Độ chệch - sai số do giả định đơn giản hóa mô hình.

### 🧠 Mạng nơ-ron cơ bản (Neural Networks)
- [[Perceptron]]: Đơn vị phân loại tuyến tính cơ bản, nền tảng của mạng nơ-ron.
- [[Neural Network]]: Mạng nơ-ron nhân tạo mô phỏng hoạt động não bộ.

---

## 🧩 2. Các thành phần mô hình (Components)
Các khối xây dựng chi tiết của một mô hình học máy:

- **Hàm kích hoạt ([[Activation function]])**:
  - [[Sigmoid function]]: Hàm kích hoạt phi tuyến đưa giá trị về khoảng $(0, 1)$.
  - [[Softmax]]: Hàm kích hoạt chuẩn hóa đầu ra thành phân phối xác suất cho phân loại đa lớp.
- **Hàm mất mát ([[Loss function]])**:
  - [[Components/Loss function/Definition|Definition]]: Định nghĩa và vai trò của hàm mất mát đối với một điểm dữ liệu.
  - [[MSE]] (Mean Squared Error): Hàm mất mát bình phương trung bình.
  - [[Log loss (Cross-entropy Loss)]]: Hàm mất mát cho bài toán phân loại.
- **Hàm chi phí ([[Cost Function]])**:
  - [[Log Loss Cost Function]]: Hàm chi phí Log Loss trên toàn bộ tập dữ liệu.
  - [[Mean Squared Error Cost Function (MSE)]]: Hàm chi phí MSE trên toàn bộ tập huấn luyện.

---

## 🧮 3. Toán học cho AI (Math for AI)
Toán học là nền tảng cốt lõi của mọi thuật toán Machine Learning. Xem chi tiết các khái niệm Toán học tại bản đồ riêng biệt:

👉 **[[MathForAI MOC]]**

Bao gồm các phần chính:
1. **Đại số tuyến tính (Linear Algebra)**: Vector, Matrix, Phép toán ma trận, Eigenvalues/Eigenvectors, PCA.
2. **Giải tích (Calculus)**: Gradient Descent, Derivative Rules, Partial Derivative, Optimization.
3. **Xác suất (Probability)**: Bayes Theorem, Probability Distributions, Random Variables, Expectation & Variance.
4. **Thống kê (Statistics)**: Hypothesis Testing, Confidence Intervals, MLE, MAP, Central Limit Theorem.
