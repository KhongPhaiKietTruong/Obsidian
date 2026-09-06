dịch: trung bình trọng số lũy thừa 

là cách tính trung bình mà chúng ta sẽ quan tâm đến giá trị gần đây hơn so với các giá trị đã cũ (trọng số của giá trị càng cũ thì càng nhỏ)
công thức:
$$
v_t = (1-\beta)x_t + \beta v_{t-1} 
$$
với:
- t là thời điểm hiện tại
- $v_t$ là giá trị trung bình tại thời điểm hiện tại 
- $\beta$ là tham số làm mượt, tham số này có giá trị từ (0, 1), dùng để điều chỉnh độ "nhớ" của EWA đối với các giá trị cũ, $\beta$ càng lớn thì nhớ giá trị cũ lâu hơn đường đồ thị mượt hơn (ít biến động khi thấy giá trị mới), $\beta$ càng thấp thì trí nhớ ngắn hạn hơn, đường đồ thị dễ biến động mạnh khi gặp giá trị mới 

một ví dụ cụ thể để dễ hình dung:  
$$
v_t​=0.1x_t​+0.09x_{t−1}​+0.081x_{t−2}​+0.0729x_{t−3}​+⋯
$$
có thể thấy rằng, x càng cũ thì trọng số của nó càng nhỏ dần, và tất cả trọng số của x cộng lại sẽ là 1 

đường màu đỏ chính là EWA
![[Pasted image 20260906203434.png]]
