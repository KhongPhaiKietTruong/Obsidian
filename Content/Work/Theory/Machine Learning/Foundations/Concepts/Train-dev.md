tập này được sinh ra khi có hiện tượng [[Data Mismatch (Sự Không Khớp Dữ Liệu)]]

tác dụng lớn nhất của tập này là để xác định xem xem cái độ lệch giữa [[Train Error]] và [[Val Error - Dev Error]] là do  [[Overfitting - High Variance]] hay là [[Data Mismatch (Sự Không Khớp Dữ Liệu)]] 

nó là một phần nhỏ được lấy ra từ [[Training Set (Tập Huấn Luyện)]] và nó không được sử dụng để training mà được sử dụng để
- xác định xem model có đang bị overfit hay không bằng cách độ lệch giữa [[Train Error]] và train-dev error 
- xác định xem model đang gặp hiện tượng [[Data Mismatch (Sự Không Khớp Dữ Liệu)]] hay không bằng độ lệch giữa train-dev error và [[Val Error - Dev Error]] 