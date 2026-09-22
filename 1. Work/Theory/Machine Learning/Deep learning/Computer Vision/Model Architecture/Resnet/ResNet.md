là viết tắt của: Residual Network 

## Định Nghĩa 
ResNet là một kiến trúc model dùng để giải quyết [[Optimization Degradation]] 
tất cả là nhờ vào [[Skip Connection]], trong mạng neural bình thường, việc học các tham số để các [[Neuron]] ở lớp thừa sẽ rất khó, do đó,  ta cho sẵn nó là x luôn rồi học để biến cái phần thừa đi kèm x bằng 0 (để tất cả trở thành [[Idenity Function]])
$$
H(x)=F(x)+x
$$
với:
- H(x) là hàm ta mong muốn 
- F(x) là [[Residual Function]] 
- x là input 
ta sẽ học để F(x)=0, từ đó ta có được hàm đồng nhất H(x)=x (tham khảo thêm ở [[Optimization Degradation]] để biết vì sao ta cần cái này)

> [!note]
> việc học cho F(x)=0 sẽ dễ dàng hơn so với việc học để trở thành hàm đồng nhất

## Tác Dụng 
giúp ta không cần phải xác định chính xác độ sâu của [[Neural Network]], bởi vì resnet cho phép ta dùng thừa [[Layer]] mà không làm model kém hiệu quả đi 
