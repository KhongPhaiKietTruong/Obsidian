các giá trị learning rate có thể thử: 0.001 -> 0.003 -> 0.01 -> 0.03 -> 0.1 -> 0.3 -> 1

nếu đã đặt giá trị learning ở mức rất nhỏ rồi nhưng mà [[Learning Curve (Đường Cong Học Tập)]] vẫn có xu hướng tăng lên thì rất có thể là do bug trong code 

để chọn được learning rate tốt thì thử qua các learning khác nhau, tìm lr mà lớn (khiến learning curve tăng dần / gấp khúc), tìm lr mà nhỏ (learning curve giảm nhưng chậm)
sau đó ta có thể lấy lr tốt bằng cách lấy cái lr lớn nhất mà bé hơn cái lr lớn (khiến lc tăng dần/gấp khúc) mà learning curve sẽ có xu hướng giảm 

![[Pasted image 20260826101337.png]]