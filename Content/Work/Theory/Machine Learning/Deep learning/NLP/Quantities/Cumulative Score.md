là "điểm số" của một chuỗi đang được tạo dang dở, được tích lũy qua từng token được tạo ra 
cách tính:
$$
\text{Score}(y_{1:t}) = \prod_{i=1}^{t} P(y_i \mid y_1, \ldots, y_{i-1}, x)
$$
ví dụ cụ thể với time step t = 3:
$$
P(y_1, y_2, y_3 \mid x) = P(y_1 \mid x)\,P(y_2 \mid y_1, x)\,P(y_3 \mid y_1, y_2, x)
$$
tuy nhiên cách này sẽ khiến accumulative score trở nên càng ngày càng nhỏ gây ra hiện tượng [[Underflow]], ta sẽ biến đổi nó thành log và tách các phép nhân xác suất với nhau ra thành các phép cộng:

