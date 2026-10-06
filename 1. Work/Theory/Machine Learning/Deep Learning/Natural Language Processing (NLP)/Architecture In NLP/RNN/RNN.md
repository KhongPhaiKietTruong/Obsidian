viết tắt của: Recurrent Neural Network

## Định Nghĩa 
RNN là một [[Neural Network]] được thiết kế để xử lí dữ liệu dạng chuỗi (như văn bản, time series, ...) bằng cơ chế lưu trữ thông tin trước đó trong các [[Activations In RNN (Hidden State)|Hiddent State]] 

có nhiều biến thể khác nhau của vanilla RNN khi ta thực hiện thay đổi cách mà nó output:
- **Many-to-one**: sentiment classification
- **One-to-many**: sequence generation (image captioning)
- **Many-to-many (1), Tx=Ty**: sequence labeling (POS tagging)
- **Many-to-many (2), Tx≠Ty**: dịch máy 
![[Pasted image 20260918202104.png|464]]
## Đặc Điểm 
- sử dụng cơ chế Backpropagation Through Time  
## Nhược Điểm 
- Dễ bị [[Vanishing Gradient]] (do dùng [[Tanh]]) 
- Phải thực hiện tính toán tuần tự mà không phải song song gây mất thời gian 
- Thông tin bị lại thành một vector hidden state duy nhất gây mất mát thông tin 