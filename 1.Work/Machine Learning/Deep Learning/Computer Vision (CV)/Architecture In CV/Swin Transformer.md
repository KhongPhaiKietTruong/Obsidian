viết tắt của: Shifted Window Transformer 

## Định Nghĩa 
Kiến trúc này hoạt động bằng cách chia một bức ảnh thành các windows, mỗi window được chia thành các patch và áp dụng cơ chế [[Self-Attention]] cho các patch trong cùng một window
![[Pasted image 20261106205223.png|546]]
lúc này thì vẫn còn một hạn chế là các window không thể trao đổi thông tin với nhau, do đó ta thực hiện dịch chuyển các window một đoạn bằng 1/2 kích thước của nó, khi đó, các patch giữa window cũ và mới có sự giao nhau, giúp các window trao đổi thông tin với nhau 
![[Pasted image 20261106205538.png|518]]
Ngoài ra, swin transformer còn có kiến trúc phân tầng giúp thực hiện Object Detection và [[Segmentation]] hiệu quả hơn 

## Công Dụng 
- Segmentation 
- Object Detection 