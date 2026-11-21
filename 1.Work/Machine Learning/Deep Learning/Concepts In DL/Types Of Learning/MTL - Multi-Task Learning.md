## Định Nghĩa 
Multi-task learning là một phương pháp huấn luyện model để giải quyết cùng một lúc nhiều vấn đề 
vd: một model thực hiện đồng thời cả ba tác vụ face detection + age estimation + gender classification 

## Kiến Trúc Phổ Biến 
### Hard Parameter Sharing 
Model sử dụng chung một [[Backbone]] để trích xuất đặc trưng, sử dụng các [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]] khác nhau cho từng tác vụ 
![[Pasted image 20261121083646.png|271]]
### Soft Paramemter Sharing 
Model sử dụng riêng từng [[Neural Network]] cho từng tác vụ, giữa các mạng có thể chia sẻ thông tin với nhau 
![[Pasted image 20261121083702.png|259]]
## Loss Function 
Mỗi một tác vụ sẽ có một [[Loss Function]] riêng, tạo thành một loss chung, loss của ví dụ (trên phần định nghĩa) là:
$$
L_{total} = \lambda_1 L_{cls} +\lambda_2 L_{det} +\lambda_3 L_{seg}
$$

