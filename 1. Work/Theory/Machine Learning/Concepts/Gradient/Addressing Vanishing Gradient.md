## Sử dụng Activations Function phù hợp 
các [[Activations]] như [[Sigmoid]] hay [[Tanh]] rất dễ gây ra [[Vanishing Gradient]], do đó ta có thể chọn các hàm kích hoạt khác phù hợp hơn như [[ReLU]], ... 

## Dùng các phương pháp khởi tạo trọng số 
[[He Initialization]], [[Xavier Initialization]] 

## Dùng kĩ thuật chuẩn hóa 
[[Batch Norm]], [[Layer Normalization]] 

## Thiết kế kiến trúc mạng 
- sử dụng [[Skip Connection]] như [[ResNet]] 
- sử dụng cơ chế cổng cho mỗi [[Neuron]] như [[GRU cell]], [[LSTM cell]] 

## Sử dụng optimizer phù hợp 
sử dụng các [[Optimizer]] có dùng kĩ thuật [[Adaptive Learning Rate]] như [[Adam]], [[AdamW]], [[RMSProp]], ... 