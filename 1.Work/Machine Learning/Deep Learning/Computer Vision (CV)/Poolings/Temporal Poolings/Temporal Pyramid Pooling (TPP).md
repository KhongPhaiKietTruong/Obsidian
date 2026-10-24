## Định Nghĩa 
thực hiện xử lí một chuỗi thời bằng một cấu trúc kim tự tháp, mỗi tầng trong kim tự tháp ta tự hiện chia chuỗi đó ra thành n chuỗi con, ta sẽ lấy pooling (khuyến khích là max pooling hoặc dùng cả hai) của từng chuỗi con đó  
ví dụ: 
- **Level 1 (Toàn cục):** Chia chuỗi thành **1 đoạn** (toàn bộ video) $\rightarrow$ Pooling ra $1$ vector (nắm bắt ngữ cảnh chung).
- **Level 2 (Nửa đầu - Nửa sau):** Chia chuỗi thành **2 đoạn bằng nhau** $\rightarrow$ Pooling riêng từng đoạn $\rightarrow$ Ra $2$ vector (nắm bắt giai đoạn đầu và cuối).
- **Level 3 (Chi tiết hơn):** Chia chuỗi thành **4 đoạn bằng nhau** $\rightarrow$ Pooling riêng từng đoạn $\rightarrow$ Ra $4$ vector (nắm bắt diễn biến từng phần tư chuỗi).

## Ưu Điểm 
- nắm bắt được ngữ cảnh thời gian 
- kích thước đầu ra luôn cố định 