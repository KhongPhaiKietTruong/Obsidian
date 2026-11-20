chia thành hai dạng là image-level và pixel-level 

một vấn đề thường gặp là số mẫu có bất thường rất ít 

có 4 hướng tiếp cận chính cho dạng này:
- **Reconstruct-based Methods**: train model học cách tái tạo ảnh bình thường, đưa ảnh mới vào và yêu cầu model tái tạo lại ảnh đó, tính reconstruction error bằng ảnh gốc và ảnh vừa tái tạo, nếu giá trị cao thì ảnh đó có chứa anomoly  
- **Embedding Methods (PaDim, PatchCore)**: trích xuất feature map của các ảnh bình thường, chia feature map đó ra thành các patch lưu vào bank, khi đưa ảnh mới vào, cũng trích xuất và chia ra xong so sánh giữa nó và feature map **bình thường** gần nhất, nếu khoảng cách vượt threshold thì xem là anomoly
- Teacher-Student Methods: 
- Normalizing Flow-based Methods: 