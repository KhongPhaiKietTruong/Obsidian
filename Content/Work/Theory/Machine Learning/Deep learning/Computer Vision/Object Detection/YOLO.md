kế thừa ý tưởng từ [[Convolutional Sliding Window]]

> trong YOLO, một ô được xem là có chứa object khi nó chứa tâm của object chứ không phải một phần object

 thuật toán này đưa toàn bộ ảnh vào mạng CNN và cho ra một ma trận SxS 
mỗi ô trong ma trận đó trả lời câu hỏi rằng:
"nếu tâm của object nằm trong ô này thì các tọa độ bounding box sẽ là gì"

điểm cái tiến của YOLO so với convolution sliding window chính là mỗi ô trong ma trận của YOLO có chứa thêm tọa độ bouding box nữa 