viết tắt của: Vision Transformer 

## Định Nghĩa 
ViT là một kiến trúc model dựa trên [[Transformer]] (vốn dành cho văn bản) cho bài toán thị giác máy tính mà không cần sử dụng [[Convolution]] 
## Quy trình hoạt động:
- chia ảnh thành nhiều patches (mảnh nhỏ) có kích thước mỗi patch là 16x16x3 pixel, sau đó trải phẳng nó ra thành một [[Vector]] có 768 chiều 
- từ vector mảnh ảnh đó, ta đưa nó qua một 
- thêm [[Special Token]] [[CLS]] và positional embedding (để lưu thông tin ngữ nghĩa về vị trí)
- đưa các path vào [[Encoder]] 
- đưa output của encoder vào [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head/Head|Head]] và ra kết quả 
![[Pasted image 20261002131457.png]]
## Ưu Điểm 
- nắm bắt được thông tin toàn cảnh ngay từ đầu 
## Công Dụng
- Phân Loại 
- Nhận Diện
- Phát Hiện 
- Phân Đoạn 