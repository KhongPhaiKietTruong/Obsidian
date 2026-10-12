## Định Nghĩa 
Là [[Vanilla Drop Out]] nhưng thực hiện scale thêm để bảo toàn giá trị [[Activations]] cho từng lớp (scale từ 0.75A lên A) để ở [[Inference - Test time]] không cần hệ số scale 

##  Inverted Drop Out ở Test Time
Ở test time, Inverted Drop Out Layer vẫn nằm ở đó, tuy nhiên nó sẽ hoạt động tương tự như một [[Idenity Function]]