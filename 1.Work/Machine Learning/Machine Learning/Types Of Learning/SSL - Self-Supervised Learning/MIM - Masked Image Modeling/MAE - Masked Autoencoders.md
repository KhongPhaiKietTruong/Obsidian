## Định Nghĩa 
MAE là một kiến trúc thuộc [[SSL - Self-Supervised Learning]] áp dụng cơ chế [[MIM - Masked Image Modeling]] học bằng cách để model tái tạo lại các patch ảnh bị che 

## Cơ Chế Hoạt Động 
trong paper gốc thực hiện che 75% số patch, che nhiều như vậy là để model học được nhiều 
## Ưu Điểm 
- chỉ truyền các patch ảnh không bị che vào [[Encoder]] thay vì truyền vào hết như [[BEiT]] 