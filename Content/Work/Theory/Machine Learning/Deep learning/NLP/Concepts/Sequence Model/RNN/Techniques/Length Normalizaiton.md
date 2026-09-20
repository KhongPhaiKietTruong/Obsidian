trong khi ta muốn tìm giá trị lớn nhất của [[Cumulative Score]], điều này khiến model có khuynh hướng đưa câu trả lời ngắn nhất (do các giá trị xác suất < 1 nhân với nhau hoặc các gi), để giải quyết vấn đề này, ta dùng length normalize, chia giá trị hàm cho số lượng từ trong chuỗi output:
$$
\frac{1}{T_{y}^\alpha}f(y)
$$
f(y) là hàm tượng trưng cho hai cái hàm ở trên 
chia cho số từ trong chuỗi output có thể hơi nặng, nên ta thêm mũ alpha (alpha thường là = 0.7)