chọn ngẫu nhiên vị trí của k điểm tâm cụm bằng cách chọn ngẫu nhiên k mẫu (nghĩa là lấy mẫu làm tâm cụm)

duyệt qua từng mẫu và gán mẫu đo vào cụm của tâm cụm nào gần nó nhất
xong lấy trung bình cộng các điểm của trọng cụm của từng tâm cụm xong di chuyển tâm cụm sang vị trí đó 
lặp lại từ đầu 

nếu một cụm mà không có mẫu nào thì bỏ tâm cụm đó 

có k cluster 
$c^{(i)}$ là một con số (1...K) thể hiện cluster mà mẫu thứ i thuộc về 
$\mu_{k}$ là tọa độ tâm cụm của cụm thứ k 
$\mu_{c^{(i)}}$ là tạo độ tâm cụm của cụm 

cost function của K-means còn được gọi là distortion fucntion mà nó hoàn toàn có thể mắc kẹt ở cực tiểu cục bộ, hai cái dưới chính là cực tiểu cục bộ 
giải pháp: chạy k-means nhiều lần và chọn cái mà có cost function nhỏ nhất 
![[Pasted image 20260912222706.png]]

