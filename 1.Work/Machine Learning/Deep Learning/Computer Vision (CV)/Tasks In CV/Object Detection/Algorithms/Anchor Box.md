Ta định nghĩa sẵn nhiều [[Bounding Box]] có kích thước và tỉ lệ khác nhau, khi model thực hiện detect, model không cần phải dự đoán ra các toạ độ mà chỉ cần xếp các anchor box có sẵn lên object, mỗi một vị trí trên [[Feature Map]] sẽ có nhiều anchor box (ngay cả khi vị trí đó không có object ta cần detect)
với mỗi anchor box, ta cần dự đoán 2 loại thông tin:
- classfication: anchor box đó có chứa object hay không hoặc là object thuộc class nào 
- các giá trị để chỉnh toạ độ bounding box lại sao cho khớp với [[Ground Truth]] 
![[Pasted image 20261106215554.png]]

Anchor Box dùng để giải quyết vấn đề trong một ô có đến nhiều điểm trung tâm của nhiều vật thể

ta định nghĩa sẵn n cái anchor box, rồi xét trong cái ô đó, gán anchor box đó cho vật thể có [[IoU - Intersection over Union]] của nó với anchor box cao nhất

>[!notes]
nếu ta sử dụng n anchor box thì với mỗi ô ảnh ta xét sẽ cho ra n bounding box dù cho ô ảnh đó có vật thể cần detect hay không (những bounding box trong ô ảnh không có vật thể sẽ có $p_{c}$ rất thấp)