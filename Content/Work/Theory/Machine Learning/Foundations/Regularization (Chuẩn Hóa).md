​	​	khi ta cố tìm một đường trên đồ thị mà khớp với các điểm dữ liệu trong [[Training Set (Tập Huấn Luyện)]] nhất, điều này có thể gây ra việc đường đó trở nên uốn éo quá mức gây ra [[Overfitting - High Variance]] nhưng lại đi qua đúng tất cả các điểm khiến cho [[Cost Function (Hàm Chi Phí)]] đạt nhỏ nhất và ta chọn đường này, tuy nhiên đường này lại là biểu hiện của overfitting, chúng ta cần một hàm loss mới để cho đường thẳng không uốn éo quá mức nhưng cũng phải gần với các điểm nhất, ta sẽ thêm tham số penalty vào hàm cũ, khi hàm quá uốn éo nghĩa là nó có nhiều hệ số (số đứng trước x) với giá trị rất cao, điều ta muốn là hệ số đó bé nhất có thể (để đường cong không quá phức tạp), ta sẽ định nghĩa một hàm pentalty liên quan mật thiết với các hệ số đó vào để hàm mất mát mới sẽ xét với cả hai yếu tố là độ khít và độ phức tạp của đường luôn chứ không phải chỉ độ khít 
$$\text{Hàm chi phí mới} = \text{Hàm chi phí ban đầu} + \text{Thành phần phạt }$$
công thức của thành phần phạt là:
$$
\frac{\lambda}{2m} \sum_{i=1}^{m} w_{j}^2
$$
với:
- $\lambda$ là hệ số chuẩn hóa (khá giống với [[Learning Rate (Tốc Độ Học)]])
- m là số lượng mẫu trong [[Training Set (Tập Huấn Luyện)]] 

nếu chọn $\lambda$ quá lớn sẽ khiến cho mô hình bị [[Underfitting]] khi mà các trọng số w sẽ rất nhỏ để hàm chi phí đạt giá trị nhỏ nhất
còn nếu $\lambda$ quá nhỏ sẽ khiến cho mô hình bị [[Overfitting - High Variance]] khi mà các hệ số w có thể tăng lên rất cao mà không bị kiềm hãm bởi vì hệ số đi kèm của nó (tức $\lambda$) khiến cho mức độ đóng góp của hệ số vào hàm chi phí trở nên nhỏ
![[Pasted image 20260515181101.png]]