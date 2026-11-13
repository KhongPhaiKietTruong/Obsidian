## Định Nghĩa 
Segmentation Mask của một ảnh là một [[Tensor]] có [[Spatial Size]] bằng với ảnh đó và mỗi pixel được gán nhãn để phân loại pixel đó thuộc về đối tượng nào được biểu diễn tương ứng với từng channel 

ví dụ: bài toán phân đoạn ảnh có **3 lớp** thì segmentation mask có shape là **(B, 3, H, W)**

