## Định Nghĩa 
Dying Relu là hiện tượng xảy ra khi ta sử dụng [[ReLU]] và giá trị [[Pre-activation Value]] truyền vào [[Neuron]] là giá trị âm liên tục khiến giá trị [[Activations]] cho ra là 0 khiến neuron bị "chết"

## Nguyên Nhân 
- [[Base Learning Rate]] quá lớn khiến cho giá trị update cũng lớn theo (trọng số trừ đi cho giá trị update) (xem thêm ở [[Gradient Descent]]) 
- dữ liệu chưa được thực hiện [[Normalization]] khiến nó có phương sai lớn -> [[Exploding Gradient]] 