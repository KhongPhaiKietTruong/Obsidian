review
giá trị đạo hàm của ReLU là {0, 1}
Miền giá trị của Cross-Entropy Loss 
[[DBSCAN]] phát hiện nhiễu 
Thực hiện transpose convolution trên giấy lại 

--- 
[[MSE Cost Function]] nhạy cảm với outlier (do là bình phương sai số)
[[Linear Regression]] + [[MSE Cost Function]] = [[Convex Function (Hàm Lồi)]] 
[[1. Work/Theory/Machine Learning/Supervised Learning/Classification/Algorithms/Logistic Regression|Logistic Regression]] + [[MSE Cost Function]] = hàm không lồi 
MAE bền vững trước outlier 
L1 loss là AE 
L2 loss là SE 
Log Loss là [[BCE Loss]]
Lasso là L1 regularization 
Ridge là L2 regularization 
Trong SGD, L2 trở thành weight decauly 
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
[[AUC-ROC]] là diện tích nằm dưới [[ROC Curve]] 
[[ROC Curve]] dựa trên báo động giả và báo động đúng 
[[Hard-Margin SVM Supervised Learning]] không cho phép xâm phạm, [[Support Vectors]] trong hard-margin phải ngay trên margin  con
[[Kernel SVM - Nonlinear SVM]] có [[Decision Boundary]] là đường cong, sử dụng một hàm chuyển đổi giúp map các điểm dữ liệu 
[[Soft-Margin SVM]] cho phép xâm phạm 
[[Support Vectors]] là điểm dữ liệu nằm gần hoặc trên [[Margin Boundary]]
[[R2]] mang ý nghĩa thể hiện tỉ lệ phương sai biến mục tiêu 
Feature scaling rất quan trọng đối với [[KNN]]
Clustering thực hiện phân cụm dựa trên khoảng cách (chạy nhiều lần và so sánh [[Cost Function]] của mỗi lần để tránh [[Local Minimum (Cực Tiểu Cục Bộ)]])
DBSCAN thực hiện phân cụm dựa trên mật độ các điểm 
[[K-means]] dựa trên khoảng cách ([[Euclidean]])
Các phương pháp để tìm số cụm: [[Elbow Method]], [[Silhouette Score]]
Các phương pháp giảm chiều dữ liệu là [[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]], [[t-SNE]], [[UMAP]] 
[[1. Work/Theory/Math For Data Science/Linear Algebra/PCA|PCA]] cố gắng giữ tối đa phương sai của dữ liệu 
[[Silhouette Score]] có miền giá trị từ -1 tới 1 
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
Hai thành phần chính của [[GANs]]  là một mạng tạo sinh và một mạng phân biệt 
công dụng chính của GANs là để tạo ảnh 
Mạng ResNet sử dụng [[Skip Connection]] để giải quyết [[Optimization Degradation]] 
Optimization Degradation là hiện tượng mà model có nhiều layer hơn lại có hiệu suất kém so với model nông hơn 
Vanishing gián tiếp gây ra Optimization Degradation 
Resnet giúp xây dựng được mạng neuron rất sâu mà không gây ra [[Vanishing Gradient]]
[[Residual Block]] là một thành phần cơ bản nằm trong [[ResNet]]
Các thành phần cơ bản của [[U-Net]] gồm: [[Encoder]], Bottleneck, [[Decoder]] 
U-Net được sử dụng để thực hiện [[Semantic Segmentation]] 
AutoEncoder: nén dữ liệu sau đó khôi phục lại
AutoEncoder được sử dụng để phát hiện bất thường, khử nhiễu 
EfficientNet giúp mở rộng quy mô mạng mà vẫn tối ưu được chi phí tính toán 
InceptionNet là thực hiện với nhiều hướng, sau đó gộp lại 
Trong [[InceptionNet]], [[Pooling Layer]] phải được thực hiện với padding 
Trong InceptionNet có thực hiện [[Pointwise Convolution]] để giảm số kênh 
[[Depthwise Convolution]] là mỗi channel có một [[Filter]] riêng 
[[Pointwise Convolution]] là [[Convolution]] có kích thước [[Filter]] 1x1 
[[Same Convolution]] có [[1. Work/Theory/Machine Learning/Deep Learning/Computer Vision (CV)/Concepts/Hyperparameters In CV/Padding/Padding|Padding]] (K-1)/2 
[[Valid Convolution]] là convolution không có [[1. Work/Theory/Machine Learning/Deep Learning/Computer Vision (CV)/Concepts/Hyperparameters In CV/Padding/Padding|Padding]] (có [[Stride]] vẫn được)
Để thực hiện được [[Convolution]] lên một [[Output Tensor Z]] thì số channel của [[Filter]] phải bằng với số channel của output tensor đó (cũng nghĩa là bằng với số lượng filter của lớp trước đó)
Kích thước của output sau khi thực hiện [[Convolution]] (xem ở [[Feature Map F]])
[[Anchor Box]] -> giải quyết mì ột ô có nhiều điểm trung tâm của vật thể 
[[Classical Sliding Window]] có chi phí tính toán rất nhiều, [[Convolutional Sliding Window]] ra đời để giải quyết vấn đề này 
[[NMS - Non-max Suppression]] dùng để chọn ra bounding box trong các bounding box được gợi ý 
[[1. Work/Theory/Machine Learning/Deep Learning/Computer Vision (CV)/Object Detection/Metrics/mAP|mAP]] là một chỉ số để đánh giá một detection model (kết hợp giữa cả classification và localiì zation)
IoU được tính bằng diện tích trùng chia cho diện tích hợp 
Viterbi là một thuật toán quy hoạch động để tìm ra chuỗi có đại lượng nào đó cao nhất (chuỗi POS, ...)
POS = gán từ loại 
NER = xác định thực thể (người, tổ chức, ...)
[[Activations]] được sử dụng trong [[RNN]] là [[Tanh]] 
trong [[GRU cell]], tanh được dùng để tính trạng thái ứng viên 
2 cổng của GRU là reset gate (lượng tt cũ được dùng để tính tt mới) và update gate (lượng thông tin cũ được giữ lại)  (mỗi gate dùng một [[Sigmoid]])
Nhược điểm của RNN: dễ bị [[Vanishing Gradient]], phải tính toán tuần tự, mất mát thông tin khi nén thông tin vào một vector [[Activations In RNN (Hidden State)]] duy nhất 
[[LSTM Cell]] gồm 3 cổng: forget, input, output gate 
LSTM hoạt động dựa trên cơ chế cell state 
[[Teacher Forcing]] là cơ chế đem [[Ground Truth]] của time step trước làm input cho time step hiện tại 
[[Bidirectional RNN]] không dùng được cho vấn đề real-time 
BiRNN không thể dùng cho dạng bài sinh chuỗi được (không thể dùng làm [[Encoder]])
RNN sử dụng cùng một ma trận [[Weight (Trọng Số)]] cho tất cả time step 
Locality Sensitve Hashing là thuật toán giúp các vector nằm gần nhau có xu hướng nằm chung một bucket khi thực hiện hashing 
Length Normalization được sinh ra để giải quyết vấn đề model cho ra chuỗi quá ngắn để có được [[Cumulative Score]] cao 
trong [[Multi-Head Attention]], các head được tính toán song song với nhau 
trong [[Transformer]]:
- Q: vector query (tôi đang tìm gì)
- K: vector key (tôi đang kiếm gì)
- V: vector value (câu trả lời cho việc tìm tôi)
công thức cốt lỗi của attention: $\operatorname{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$ với cái phân số nằm bên trong gọi là **scaled dot product attention**  
training BERT bằng hai phương pháp là Mask Language Model: che từ ở giữa rồi dựa trên từ xung quanh mà đoán và Next Sentence Prediction: xem xem cái câu phía sau có liên quan đến câu phía trước hay không (truyền vào BERT 2 câu mỗi lần)
trong BERT có 3 thành phần embeddings: token (embeddings của từ sau khi train trên tập tổng quát), segment (cho biết từ hiện tại thuộc A hay B), position (vị trí của từ trong câu)
trong [[Bag of Words]], mỗi câu được biểu diễn bởi một vector thưa chứa tần suất các từ (vector đó có số chiều bằng với số chiều của [[Vocabulary]]) 
trong [[FastText]], biểu diễn các n-grams thành các vector, một từ = tổng vector của các n-grams 
[[ELMo]] cùng một từ nhưng nằm trong ngữ cảnh khác nhau thì có embeddings khác nhau, kiến trúc là ghép hai mạng LSTM lại 
nhược điểm của [[Bag of Words]] và [[TF-IDF]] là các [[Word Embeddings]] không hề có ngữ cảnh về vị trí từ trong câu 
Nhược điểm của [[GloVe]] là [[Word Embeddings]] ở dạng tĩnh, một từ ở câu ngữ cảnh khác nhau thì vẫn cùng một embeddings
Markov Chain mô tả một hệ thống chuyển từ trạng thái này sang trạng thái khác 
Consine Similarity quan tâm đến hướng 
Euclidean quan tâm đến khoảng cách 
[[Batch Norm Layer]] sẽ sử dụng running mean và running variance ở test time (mean và variance của tất cả mẫu) 
các phương pháp biến word thành embeddings: 
- GloVe -> ma trận co-occurence 
- Negative Sampling -> tạo các pair 
- Hierachical Softmax classifier -> tạo cây 
- CBOW: dự đoán center dựa trên xung quanh
- Skip-gram: dự đoán xung quanh dựa trên center 
cách tính kích thước ma trận sau tích chập 
mini-batch SGD là một batch có 2^n mẫu, SGD là 1 mẫu mỗi lần 
[[Xavier Initialization]] là dành cho [[Activations]] zero-center như [[Tanh]]
[[He Initialization]] là dành cho [[ReLU]] và các biến thể của nó 
xavier initialization dành cho activation đối xứng qua gốc tọa độ như [[Tanh]], [[Sigmoid]], [[Linear Activation]] 
Momentum GD giúp các gradient ngược hướng nhau tiệt tiêu nhau, giúp đường đi smooth hơn (Momentum là tích lũy hướng) và giúp vượt qua [[Saddle Point (Điểm Yên Ngựa)]] hoặc [[Local Minimum (Cực Tiểu Cục Bộ)]]
RMSProp GD tích lũy độ lớn giúp giải quyết địa hình hẻm núi sâu hẹp (dốc lớn -> đi bé lại, dốc bé -> đi lớn hơn)
Adam là sự kết hợp giữa [[Momentum]] và [[RMSProp]] 
AdamW thực hiện decouple weight decay = [[Adam]] + [[Weight Decay]] 
[[Overfitting - High Variance]] -> model học luôn cả nhiễu 
[[Normalization]] giúp giảm thiểu trình trạng [[Vanishing Gradient]], [[Exploding Gradient]], sự phụ thuộc vào khởi tạo trọng số và giúp model hội tụ nhanh hơn 
Z-score normalization giúp đưa dữ liệu về dạng mean=0, variance=1
normalization giúp đưa [[Pre-activation Value]] về một giá trị ổn định trước khi truyền vào [[Activations]] 
thu thập thêm nhiều mẫu không giúp giải quyết được underfitting 
data leakage -> dữ liệu liên quan đến nhãn bị rò rỉ vào [[Training Set]] 
[[Saddle Point (Điểm Yên Ngựa)]] là điểm có [[Gradient]] = 0 khiến đường đi kẹt tại đây luôn (điểm này thật sự khá hiếm) mà ta thường rơi vào [[Saddle-like Plateau (Vùng Yên Ngựa)]] hơn 
Symmetric Neural Network là hiện tượng mà cả model hoạt động chẳng khác gì một neuron duy nhất, nguyên nhân là do [[Weight (Trọng Số)]] của trọng số của các neuron giống nhau 
trong [[Batch Norm]], [[Layer Norm]], [[RMSNorm]] đều có tham số có thể học được 
Inverted Drop Out thực hiện scale thêm giá trị để giá trị activation của một layer không bị hao hụt (không cần phải scale trong [[Inference - Test time]])
[[Weight Decay]] là thực hiện giảm tham số đi một ít mỗi epoch
PEFT : thực hiện finetune trên một phần nhỏ tham số 
LoRA: tách ma trận tham số ra thành hai cái ma trận 
QLoRA thực hiện lượng tử hóa 
KNN là [[Lazy Learning]]
khắc phục [[Exploding Gradient]] bằng [[Gradient Clipping]] ([[Cliping By Norm]]) 
[[Greedy Encoding]] -> chọn token có xác suất cao nhất 
[[Beam Search]] -> giữ n ứng viên, chọn ứng viên có xác suất cao nhất 
Minium Bayes Risk (MBR) -> chọn ứng viên có trung bình độ tương đồng so với tất cả ứng viên còn lại là cao nhất 
[[Mean Pooling Layer]] gộp các vector lại thành 1 
Stemming là đưa từ về dạng gốc theo rule-based, có thể tạo ra từ không tồn tại 
Lemmatization đưa từ về dạng gốc, trả về kết quả hợp lệ 
add-one smoothing là đưa cho tần suất của mỗi từ ít nhất bằng 1 
[[Backoff]]: nếu một n-gram chưa từng xuất hiện thì lùi n-gram đó xuống một từ, lặp lại cho đến khi n-gram đó có xuất hiện 
[[Stupid Backoff]] là backoff cải tiến bằng cách thêm một hệ số 
[[Interpolation]]: sử dụng nhiều n-gram cũng lúc cùng với một trọng số mỗi n-gram 
BPE, WordPiece là phương pháp dạng bottom-up
UniGram là top-down 
TF-IDF 
skip connection trong resnet là phép cộng theo element-wise 
skip connect triong u-net là phép nối theo channel-wise 
[[L1 Regularization]] -> thưa thớt (đưa trọng số về 0)
[[L2 Regularization]] -> đưa trọng số về gần 0
[[Bagging - Sampling with replacement]] trong [[Random Forest]] giúp giảm phương sai 
[[t-SNE vs UMAP]] 

AUC-ROC không sử dụng được cho dataset bị mất cân bằng 
precision-recall trade off -> liên quan trực tiếp đến ngưỡng phân loại, khi tăng ngưỡng phân loại thì precision tăng nhưng recall giảm và ngược lại 
macro f1 score dùng trong phát hiện lớp hiếm (do chú trọng các lớp đều nhau)
trong bài toán [[Multi-Class Classification]], [[Micro F1 Score]] = [[Accuracy (Độ Chính Xác Tổng Thể)]]
[[PR-AUC]] tập trung vào lớp thiểu số 
Boosting Model giúp giảm bias 
[[MSE Cost Function]] + [[Activations]] bão hòa ([[Sigmoid]], [[Tanh]]) => [[Vanishing Gradient]] 

|                   | PCA        | t-SNE     | UMAP               |
| ----------------- | ---------- | --------- | ------------------ |
| Bản chất          | tuyến tính | phi tuyến | phi tuyến          |
| cấu trúc bảo toàn | toàn cục   | cục bộ    | toàn cục + cục bộ  |
|                   |            |           |                    |
PCA cực kì nhạy cảm với [[Outliers]] 
[[Vanilla Drop Out]] = tổng hợp của các mạng con 
