thực hiện hai lần [[Forward Propagation]] của RNN

một cái theo chiều trái qua phải và một cái theo chiều ngược lại 

mỗi cái prediction sẽ bị ảnh hưởng bởi cả hướng, prediction $\hat{y}^{<3>}$ sẽ bị ảnh hưởng bởi $x^{<1>}, x^{<2>}$ và cả $x^{<4>}, x^{<5>}$ 
![[Pasted image 20260919021703.png]]
các cell trong kiến trúc này cũng có thể dùng [[GRU]], [[LSTM]], ... 

Bidirectional RNN + LSTM là combo phổ biến sử dụng 