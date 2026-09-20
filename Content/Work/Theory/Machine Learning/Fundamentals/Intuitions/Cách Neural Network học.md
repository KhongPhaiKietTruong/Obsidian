![[Pasted image 20260903194755.png]]

cách hoạt động nôm na của [[Neural Network]] là khi mỗi mẫu đi qua mạng neural, thì mạng neural đó sẽ cho ra [[Predicted Value]], từ cái kết quả dự đoán đó ta tính ra được [[Loss Function|Loss Function]] của mẫu đó, sau đó ta tính mức độ đóng góp của [[Weight|trọng số w]] vào Loss và [[Content/Work/Theory/Machine Learning/Fundamentals/Quantities/Bias| bias b]] vào loss, nếu như mức độ đóng góp của w và b vào loss lớn thì giá trị update ([[Gradient Descent]]) của w và b cũng to theo để điều chỉnh model sao cho ra kết quả gần với mẫu hiện tại (đưa vào tất cả mẫu nên model cuối cùng sẽ là "trung hòa" giữa sự update w, b của các mẫu)

W là ma trận và khi update thì các w(i ,j) sẽ update không đồng đều với nhau mà tùy thuộc vào mức độ đóng góp của w(i, j) đó vào loss, đó là lí do model học được theo dữ liệu (nó thay đổi theo hướng của dữ liệu) 

