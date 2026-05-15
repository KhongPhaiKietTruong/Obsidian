dịch: sự điều điều hòa, sự chuẩn hóa

khi ta cố tìm một đường trên đồ thị mà khớp với các điểm nhất, điều này có thể gây ra việc đường đó trở nên uốn éo quá mức nhưng lại đi qua đúng tất cả các điểm khiến cho [[Loss function]] đạt nhỏ nhất và ta chọn đường này, tuy nhiên đường này lại là biểu hiện của overfitting, chúng ta cần một hàm loss mới để cho đường thẳng không uốn éo quá mức nhưng cũng phải gần với các điểm nhất, ta sẽ thêm tham số penalty vào hàm cũ, khi hàm quá uốn éo nghĩa là nó có nhiều hệ số với giá trị rất cao, vậy thì ta muốn hệ số đó bé nhất có thể, ta sẽ định nghĩa một hàm pentalty liên quan mật thiết với các hệ số đó vào để hàm mất mát mới sẽ xét với cả hai yếu tố là độ khít và độ phức tạp của đường luôn chứ không phải chỉ độ khít như hàm loss cũ
$$\text{Hàm mất mát mới} = \text{Hàm mất mát ban đầu} + \text{Thành phần phạt (Penalty)}$$

![[Pasted image 20260515181101.png]]