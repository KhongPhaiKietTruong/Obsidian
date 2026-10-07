viết tắt của: Vision Transformer 

## Định Nghĩa 
ViT là một kiến trúc model dựa trên [[Transformer]] (vốn dành cho văn bản) cho bài toán thị giác máy tính mà không cần sử dụng [[Convolution]] 
quy trình hoạt động cốt lõi:
- chia ảnh thành nhiều patch
- thêm token CLS và positional embedding (để lưu thông tin ngữ nghĩa về vị trí)
- đưa các path vào [[Encoder]] 
- đưa output của encoder vào [[1. Work/Theory/Machine Learning/Concepts In ML/Model Architecture/Head/Head|Head]] và ra kết quả 
![[Pasted image 20261002131457.png]]
## Ưu Điểm 
- nắm bắt được thông tin toàn cảnh ngay từ đầu 
## Công Dụng
- Phân Loại 
- Nhận Diện
- Phát Hiện 
- Phân Đoạn 