viết tắt của: Vision Transformer 

## Định Nghĩa 
ViT là một kiến trúc model dựa trên [[Transformer]] (vốn dành cho văn bản) cho bài toán thị giác máy tính mà không cần sử dụng [[Convolution]] 
## Quy trình hoạt động:
- chia ảnh thành nhiều patches (mỗi patch là một token) có kích thước mỗi patch là 16x16x3=768 pixels, sau đó trải phẳng mỗi patch ra thành một [[Vector]] có 768 chiều 
- từ vector patch đó, ta đưa nó qua một [[FC - Fully Connected Layer]] không có hàm [[Activations]] để biến nó thành một [[Patch Embedding]] 
- thêm [[Special Token]] [[CLS]] và [[Positional Encoding]] vào Patch Embedding 
- đưa patch embedding đó vào [[Transformer Encoder]] và cho ra patch embedding có "chất lượng" cao hơn 
- đưa output của transformer encoder vào [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head/Head|Head]] và cho ra kết quả 
![[Pasted image 20261002131457.png]]
## Ưu Điểm 
- nắm bắt được thông tin toàn cảnh ngay từ đầu 
## Công Dụng
- dùng trong tác vụ phân loại bằng cách lấy ra [[Special Token]] và truyền vào một [[FC - Fully Connected Layer]] có out_features là số lớp ảnh 
- Nhận Diện 
- Phân Đoạn 