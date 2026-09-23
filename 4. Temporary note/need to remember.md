giá trị đạo hàm của ReLU là {0, 1} 

ở test time thì sẽ không có [[Dropout Layer]] 

[[Batch Norm Layer]] sẽ hoạt động khác khi ở test time 

biến word thành embeddings:
GloVe -> ma trận co-occurence 
Negative Sampling -> tạo các pair 
Hierachical Softmax classifier -> tạo cây 
CBOW: dự đoán center dựa trên xung quanh
Skip-gram: dự đoán xung quanh dựa trên center 