​	​	khi ta cố tìm một đường trên đồ thị mà khớp với các điểm dữ liệu trong [[Training Set (Tập Huấn Luyện)]] nhất, điều này có thể gây ra việc đường đó trở nên uốn éo quá mức gây ra [[Overfitting - High Variance]] nhưng lại đi qua đúng tất cả các điểm khiến cho [[Cost Function (Hàm Chi Phí)]] đạt nhỏ nhất và ta chọn đường này, tuy nhiên đường này lại là biểu hiện của overfitting, chúng ta cần một hàm cost mới để cho đường thẳng không uốn éo quá mức nhưng cũng phải gần với các điểm nhất, ta sẽ thêm tham số penalty vào hàm cũ, khi hàm quá uốn éo nghĩa là nó có nhiều hệ số (số đứng trước x - [[Weight (Trọng Số)]] w) với giá trị rất cao, điều ta muốn là hệ số đó bé nhất có thể (để đường cong không quá phức tạp), ta sẽ định nghĩa một hàm pentalty liên quan mật thiết với các hệ số đó vào để hàm chi phí mới sẽ xét với cả hai yếu tố là độ khít và độ phức tạp của đường luôn chứ không phải chỉ độ khít 
$$J_{new} = J_{old} + penalty$$
công thức của thành phần phạt là:
$$
\frac{\lambda}{2m} \sum_{i=1}^{m} w_{j}^2
$$
với:
- $\lambda$ là [[Regularization Coefficient (Hệ Số Chuẩn Hóa)]] (khá giống với [[Learning Rate (Tốc Độ Học)]])
- m là số lượng mẫu trong [[Training Set (Tập Huấn Luyện)]] 

sau khi thêm thành phần phạt vào hàm cost rồi thì khi thực hiện update w bằng [[Gradient descent]] cũng sẽ thay đổi
trước khi thêm regularization:
$$
w = w-\alpha\frac{ \partial J }{ \partial w } 
$$
sau khi thêm regularization:
$$
W := \left(1 - \alpha \frac{\lambda}{m}\right)W - \alpha \frac{\partial J}{\partial W}
$$


nếu chọn $\lambda$ quá lớn sẽ khiến cho mô hình bị [[Underfitting - High Bias]] khi mà các trọng số w sẽ rất nhỏ để hàm chi phí đạt giá trị nhỏ nhất
còn nếu $\lambda$ quá nhỏ sẽ khiến cho mô hình bị [[Overfitting - High Variance]] khi mà các hệ số w có thể tăng lên rất cao mà không bị kiềm hãm bởi vì hệ số đi kèm của nó (tức $\lambda$) khiến cho mức độ đóng góp của hệ số vào hàm chi phí trở nên nhỏ
![[Pasted image 20260515181101.png]]