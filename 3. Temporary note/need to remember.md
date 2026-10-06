[[MSE Cost Function]] nhạy cảm với outlier (do là bình phương sai số)
[[Linear Regression]] + [[MSE Cost Function]] = [[Convex Function (Hàm Lồi)]] 
[[1. Work/Theory/Machine Learning/Supervised Learning/Classification/Algorithms/Logistic Regression|Logistic Regression]] + [[MSE Cost Function]] = hàm không lồi 
MAE bền vững trước outlier 
giá trị đạo hàm của ReLU là {0, 1} 
Dropout hoạt động như thế nào ở test time
L1 loss là AE 
L2 loss là SE 
Log Loss là gì 
Miền giá trị của Cross-Entropy Loss 
Lasso là L1 regularization 
Ridge là L2 regularization 
Trong SGD, L2 trở thành weight decay 
L1 $\approx$ [[Features Selection]] 
ElasticNet là sự kết hợp của linear regression, L1 và cả L2 
Decision gồm 3 loại node là root node, decision node, leaf node 
[[Normalization]] sẽ không có tác dụng đối với các thuật toán dạng cây 
Miền giá trị của [[Entropy (Mức độ hỗn loạn)]] là \[0, 1]
[[Entropy (Mức độ hỗn loạn)]] đạt cực đại khi phân phối xác suất các lớp là [[Uniform distribution (Phân Phối Đều)]] (số mẫu chia đều ra cho số lớp)
[[Gini Impurity]] là một đại lượng giống với [[Entropy (Mức độ hỗn loạn)]], được dùng do tính toán nhanh hơn nhiều so với entropy AutoEncoder
IG là lượng [[Entropy (Mức độ hỗn loạn)]] giảm sau khi thực hiện chia 
[[Random Forest]] áp dụng [[Bagging - Sampling with replacement]] 
catboost giúp không cần dùng [[One-hot Encoding]] và còn giúp giảm [[Data Leakage]] 
[[LightGBM]] phát triển cây theo lá 
[[AUC]] là diện tích nằm dưới [[ROC Curve]] 
[[ROC Curve]] dựa trên báo động giả và báo động đúng 
[[Hard-Margin SVM Supervised Learning]] không cho phép xâm phạm, [[Support Vectors]] trong hard-margin phải ngay trên margin 
[[Kernel SVM - Nonlinear SVM]] có [[Decision Boundary]] là đường cong, sử dụng một hàm chuyển đổi giúp map các điểm dữ liệu 
[[Soft-Margin SVM]] cho phép xâm phạm 
[[Support Vectors]] là điểm dữ liệu nằm gần hoặc trên [[Margin Boundary]]
[[R2]] mang ý nghĩa thể hiện tỉ lệ phương sai biến mục tiêu 
Feature scaling rất quan trọng đối với [[KNN]]
Clustering thực hiện phân cụm dựa trên khoảng cách (chạy nhiều lần và so sánh [[Cost Function]] của mỗi lần để tránh [[Local Minimum (Cực Tiểu Cục Bộ)]])
DBSCAM thực hiện phân cụm dựa trên mật độ các điểm 
[[K-means]] dựa trên khoảng cách ([[Euclidean]])
Các phương pháp để tìm số cụm: [[Elbow Method]], [[Silhouette Score]]
Các phương pháp giảm chiều dữ liệu là [[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]], [[t-SNE]], [[UMAP]] 
[[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]] cố gắng giữ tối đa phương sai của dữ liệu 
[[Silhouette Score]] có miền giá trị từ -1 tới 1 
[[DBSCAN]] phát hiện nhiễu 
các thành phần chính trong [[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]] trực giao (vuông góc) với nhau 
trước khi thực hiện [[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]] thì gần như bắt buộc phải thực hiện [[Standardization (Z-score normalization)]] 
t-SNE thường được dùng để trực quan hóa dữ liệu 
[[AutoEncoder]] gồm hai thành phần chính là [[Encoder]] và [[Decoder]] 
[[UMAP]] là nâng cấp của [[t-SNE]], tính toán nhanh hơn 
[[Mini-Batch Stochastic Gradient Descent (Mini-batch SGD)]] giúp giảm phương sai của [[Gradient]] 
[[AdaGrad]] khiến tốc độ học suy giảm rất nhanh do nó tích lũy bình phương và ngày càng tăng dần 
Các tham số trong [[Pooling Layer]] là [[Hyperparameter (Siêu Tham Số)]] (do ta tự định nghĩa ma không được học bởi model)
Cách biểu diễn [[Output Tensor Z]] trong pytorch là (B, C, H, W)
Global Average Pooling được dùng ở vị trí trước lớp FC 
Hai thành phần chính của GANs là một mạng tạo sinh và một mạng phân biệt 
công dụng chính của GANs là để tạo ảnh 
Mạng ResNet sử dụng [[Skip Connection]] để giải quyết [[Optimization Degradation]] 
Optimization Degradation là hiện tượng mà model có nhiều layer hơn lại có hiệu suất kém so với model nông hơn 
Vanishing gián tiếp gây ra Optimization Degradation 
Resnet giúp xây dựng được mạng neuron rất sâu mà không gây ra [[Vanishing Gradient]]
[[Residual Block]] là một thành phần cơ bản nằm trong [[ResNet]]
Các thành phần cơ bản của U-Net gồm: [[Encoder]], Bottleneck, [[Decoder]] 
U-Net được sử dụng để thực hiện [[Semantic Segmentation]] 
AutoEncoder: nén dữ liệu sau đó khôi phục lại
AutoEncoder được sử dụng để phát hiện bất thường, khử nhiễu 


[[Batch Norm Layer]] sẽ hoạt động như thế nào khi ở test time ?
biến word thành embeddings:
- GloVe -> ma trận co-occurence 
- Negative Sampling -> tạo các pair 
- Hierachical Softmax classifier -> tạo cây 
- CBOW: dự đoán center dựa trên xung quanh
- Skip-gram: dự đoán xung quanh dựa trên center 
công thức tính ecludian ? 
cách tính kích thước ma trận sau tích chập 
khi thực hiện [[Same Convolution]] thì padding phải thêm là bao nhiêu ?
mini-batch SGD vs SGD 
công thức tính entropy
công thức tính Information Gain 
công thức tính Softmax 
he initialization là gì Canonically
xavier initialization là gì 
Momentum GD ?
RMSProp GD ?
Adam ?
AdamW ?
skip connection là gì ?
skip connection trong resnet vs trong u-net
TF-IDF 
skip connection trong resnet là phép cộng theo element-wise 
skip connect triong u-net là phép nối theo channel-wise 
[[L1 Regularization]] -> thưa thớt (đưa trọng số về 0)
[[L2 Regularization]] -> đưa trọng số về gần 0
[[Bagging - Sampling with replacement]] trong [[Random Forest]] giúp giảm phương sai 
[[t-SNE vs UMAP]]