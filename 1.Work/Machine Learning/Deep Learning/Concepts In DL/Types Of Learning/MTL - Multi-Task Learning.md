## Định Nghĩa 
Multi-task learning là một phương pháp huấn luyện model để giải quyết cùng một lúc nhiều vấn đề 
vd: một model thực hiện đồng thời cả ba tác vụ face detection + age estimation + gender classification 

## Kiến Trúc Phổ Biến 
### Hard Parameter Sharing 
Model sử dụng chung một [[Backbone]] để trích xuất đặc trưng, sử dụng các [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]] khác nhau cho từng tác vụ 
### Soft Paramemter Sharing 