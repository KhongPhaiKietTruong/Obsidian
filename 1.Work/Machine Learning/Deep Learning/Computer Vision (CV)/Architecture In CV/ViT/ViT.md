viết tắt của: Vision Transformer 

## Định Nghĩa 
ViT là một kiến trúc model dựa trên [[Transformer]] (vốn dành cho văn bản) cho bài toán thị giác máy tính mà không cần sử dụng [[Convolution]] 
## Quy trình hoạt động:
- chia ảnh thành nhiều patches (mảnh nhỏ) có kích thước mỗi patch là 16x16x3 pixel, sau đó trải phẳng nó ra thành một [[Vector]] có 768 chiều 
- từ vector mảnh ảnh đó, ta đưa nó qua một [[Fully Connected Layer (FC)]] không có hàm [[Activations]] để biến nó thành một [[Patch Embedding]] 
- thêm [[Special Token]] [[CLS]] và [[Positional Encoding]] vào Patch Embedding 
- đưa patch embedding đó vào [[Transformer Encoder]] và cho ra patch Embedding có "chất lượng" cao hơn 
- đưa output của encoder vào [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head/Head|Head]] và ra kết quả 
![[Pasted image 20261002131457.png]]
## Ưu Điểm 
- nắm bắt được thông tin toàn cảnh ngay từ đầu 
## Công Dụng
- dùng trong tác vụ phân loại bằng cách lấy ra [[Special Token]] và truyền vào một [[Fully Connected Layer (FC)]] có out_features là số lớp ảnh 
- Nhận Diện
- Phát Hiện 
- Phân Đoạn 