giá trị đạo hàm của ReLU là {0, 1} 

ở test time thì sẽ không có [[Dropout Layer]] 

[[Batch Norm Layer]] sẽ hoạt động khác khi ở test time 

biến word thành embeddings:
GloVe -> ma trận co-occurence 
Negative Sampling -> tạo các pair 
Hierachical Softmax classifier -> tạo cây 
CBOW: dự đoán center dựa trên xung quanh
Skip-gram: dự đoán xung quanh dựa trên center 

công thức tính ecludian ? 
cách tính kích thước ma trận sau tích chập 
khi thực hiện [[Same Convolution]] thì padding phải thêm là bao nhiêu 

có một optimizer tên là SGD nữa (trùng tên với phương pháp batch)
công thức tính entropy
công thức tính IG 
công thức tính softmax 

he initialization là dành riêng cho relu và biến thể của nó 
Momentum -> hướng 
RMSProp-> độ lớn 

skip connection trong resnet là phép cộng theo element-wise 
skip connect triong u-net là phép nối theo channel-wise 