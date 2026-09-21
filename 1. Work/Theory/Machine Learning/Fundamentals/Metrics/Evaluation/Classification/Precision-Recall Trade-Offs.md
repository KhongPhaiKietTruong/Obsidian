sự đánh đổi giữa recall và precision liên quan trực tiếp đến ngưỡng phân loại

nếu ta tăng ngưỡng phân lại lên thì model có xu hướng thận trọng hơn khi dự đoán một mẫu là positive, do đó số lượng FP giảm, khiến precision tăng nhưng lại khiến recall giảm 
và ngược lại, giảm ngưỡng khiến precision giảm nhưng recall tăng (xem công thức [[Precision (Độ chính xác)]] và [[Recall (Độ Bao Phủ)]])