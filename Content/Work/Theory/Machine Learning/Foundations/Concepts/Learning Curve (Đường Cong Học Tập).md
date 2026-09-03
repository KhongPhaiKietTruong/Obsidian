đây là một đồ thị gồm 2 đường đồ thị của [[Training Error]] và [[Validation Error]]
với trục y là độ lệch của model và trục x là số lượng mẫu trong [[Training Set (Tập Huấn Luyện)]]

dựa trên learning curve mà ta có thể đánh giá mô hình đang bị [[Overfitting - High Variance]] hay [[Underfitting - High Bias]] 


với overfitting, learning curve sẽ có hình dạng như này:
![[Pasted image 20260901190600.png]]
càng nhiều mẫu thì model học tốt hơn điều đó khiến validation error càng thấp dần 
với underfitting thì:
![[Pasted image 20260901190642.png]]

có thể thấy trong cả hai trường hợp thì [[Training Error]] đều tăng, điều đó là bình thường bởi vì số lượng mẫu càng tăng thì ta có nhiều độ lệch hơn và cộng vào khiến nó tăng lên 
trong deep learning thì trục x của đồ thị đường cong học tập sẽ là [[Iteration]] chứ không phải số lượng mẫu trong training set