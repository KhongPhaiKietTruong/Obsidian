là "điểm số" của một chuỗi đang được tạo dang dở, được tích lũy qua từng token được tạo ra 
cách tính:
$$
P(y_1, y_2, y_3 \mid x) = P(y_1 \mid x)\,P(y_2 \mid y_1, x)\,P(y_3 \mid y_1, y_2, x)
$$
tuy nhiên cách này sẽ khiến accumulative score trở nên càng ngày càng nhỏ gây ra hiện tượng [[Underflow]], ta sẽ biến đổi nó thành log
