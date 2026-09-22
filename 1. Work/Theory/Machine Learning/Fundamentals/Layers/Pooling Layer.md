## Định nghĩa
là một lớp dùng để giảm [[Spatial Size]] của [[Output Tensor Z]] lại 
cách hoạt động cũng gần giống như [[Filter]] khi mà ta có một ma trận trượt

tùy vào loại pooling mà ta áp dụng hành động tương ứng lên cái vùng trong ma trận trượt
max pooling thì lấy giá trị to nhất và average pooling thì lấy trung bình
![[Pasted image 20260916161334.png|477]]
các hypterparameter trong lớp pooling không được học bằng [[Gradient Descent]] mà là do ta tự định nghĩa, các hyperparameter gồm:
- pool size: kích thước của ma trận pool 
- [[Stride]] 
- [[1. Work/Theory/Machine Learning/Deep learning/Computer Vision/Concepts/Padding|Padding]] thường là 0 (chỉ có trường hợp ngoại lệ là padding trong [[Inception]] sẽ khác 0)
- pooling type: max hay avg

cách tính kích thước của [[Output Tensor Z]] sau một lớp pooling cũng tương tự như cách tính với filter (xem thêm trong [[Feature Map F]]) và pool cũng tính trên từng channel độc lập giống filter 

