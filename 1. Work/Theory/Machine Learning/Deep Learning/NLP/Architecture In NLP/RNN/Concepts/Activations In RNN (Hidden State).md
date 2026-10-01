kí hiệu: $h_{t}$ hoặc $a^{<t>}$ (Andrew)

là một [[Vector]] chứa tóm tắt thông tin của các timestamps trước được tính bằng công thức 
$$
a^{(t)}=g_{1}(W_{aa}a^{<t-1>}+W_{ax}x^{<t>}+b_{a})
$$
hoặc một số ghi chép có thể có cách viết với kí hiệu khác:
$$
h_t = f\left(W_{xh}x_t + W_{hh}h_{t-1} + b_h\right)
$$
đây chỉ đơn giản là giá trị [[Activations]] sau khi được truyền [[Pre-activation Value]] vào

trong RNN, activation funciton thường dùng là [[Tanh]] 