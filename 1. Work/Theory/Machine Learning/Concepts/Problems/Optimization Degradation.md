dịch: sự suy thoái hiệu suất, sự giảm hiệu suất 

## Định Nghĩa 
Degradation là vấn đề là khi ta càng thêm nhiều [[Layer]] vào một [[Neural Network]] thì lại càng khiến [[Training Error]] cao hơn mạng có ít layer hơn  

giả sử ta có hai mạng neural là A: 20 lớp và B: 56 lớp và ta muốn hiệu suất của B>=A với hiệu suất của A đã là rất cao rồi, trên lí thuyết, khi ta copy 20 lớp đầu của A sang B và 36 lớp bổ sung của B chỉ cần "không làm gì" cả là đã có thể có hiệu suất = A rồi, nhưng không, B lại có hiệu suất kém hơn A.
với "không làm gì" ở đây nghĩa là các [[Neuron]] trong 36 lớp bổ sung của B chỉ cần trả về y chang những gì đó được nhận, tức hàm [[Activations]] sẽ là một [[Idenity Function]] (lưu ý là hàm kích hoạt thực tế ta không dùng hàm đồng nhất mà mạng phải học được các tham số để  biến hàm kích thành hàm đồng nhất), và để học được những tham số như vậy trong cả 36 lớp thì sẽ gặp rất nhiều vấn đề như là [[Vanishing Gradient]], .... điều này khiến mô hình nhiều lớp hơn như A học tệ hơn mô hình ít lớp B 

> [!note] điểm mấu chốt
> điểm mấu chốt: 20 lớp đầu đã học quá tốt rồi nên 36 lớp sau không còn cái để học nên nó phải học cách "không làm gì" để giữ được độ tốt đó, nhưng để học được cách không làm gì sẽ gặp nhiều vấn đề khiến cho cả mô hình tệ đi


## Giải Pháp
mô hình [[ResNet]] được xây dựng nên để giải quyết vấn đề này 