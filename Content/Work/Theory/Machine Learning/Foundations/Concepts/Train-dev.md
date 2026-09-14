tập này được dùng khi có hiện tượng [[Data Mismatch (Sự Không Khớp Dữ Liệu)]]

nó là một phần nhỏ được lấy ra từ [[Training Set (Tập Huấn Luyện)]] và nó không được sử dụng để training mà được sử dụng xác định xem xem cái độ lệch giữa [[Train Error]] và [[Val Error - Dev Error]] là do  [[Overfitting - High Variance]] hay là [[Data Mismatch (Sự Không Khớp Dữ Liệu)]] bằng cách tính độ lệch giữa train-dev error và dev error

giả sử một model có độ lệch giữa train error và dev error là 10% nhưng giữa train-dev error và dev error là 9% thì nghĩa là mô hình này có mức độ overfit là 1% và mức độ mismatch là 9%
