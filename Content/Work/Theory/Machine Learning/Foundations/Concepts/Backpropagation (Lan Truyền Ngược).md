sau khi [[Neural Network (Mạng Neural)]] thực hiện [[Forward Propogation (Lan Truyền Xuôi)]] để cho ra [[Predicted Value (Giá Trị Dự Đoán)]], ta tính [[Loss function (Hàm Mất Mát)]] giữa giá trị dự đoán đó và [[Target variable - Ground Truth (Giá Trị Thực Tế)]] rồi tổng hợp các loss lại thành [[Cost Function (Hàm Chi Phí)]] J, sau đó ta sẽ tiến hành xem xét mức độ đóng góp của w vào J và của b vào J, mức độ đóng góp càng lớn thì việc update biến đó bằng [[Gradient Descent]] cũng càng lớn 

lưu ý: giá trị update của w và b không phụ thuộc vào giá trị của loss mà chỉ phụ thuộc vào mức độ đóng góp của nó cho 

