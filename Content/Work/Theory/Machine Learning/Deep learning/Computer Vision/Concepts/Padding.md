là đường viền mà ta sẽ thêm vào ảnh
để giải quyết hai vấn đề chính:
- qua từng phép [[Convolve (Tích Chập)]], ảnh ngày càng trở nên nhỏ 
- các pixel nằm ở góc và cạnh không được sử dụng nhiều (nó chỉ được sử dụng 1 hoặc vài lần trong phép tích chập tại chính vị trí của nó, trong khi các pixel ở trung tâm thì lại được dùng rất nhiều)
giả sử ta thêm một pad có độ dày là p=1 thì kích thước ma trận là:
$$
I 
$$