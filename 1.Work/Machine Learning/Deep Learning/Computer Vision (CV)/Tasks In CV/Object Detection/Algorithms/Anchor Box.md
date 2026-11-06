Ta định nghĩa sẵn nhiều [[Bounding Box]] có kích thước và tỉ lệ khác nhau, khi model thực hiện detect, model không cần phải dự đoán ra các toạ độ mà chỉ cần xếp các anchor box có sẵn lên object, mỗi một vị trí trên [[Feature Map]] sẽ có nhiều anchor box ngay cả khi vị trí đó không có object ta cần detect (để giải quyết vấn đề một vị trí trong feature map có thể có nhiều tâm vật thể)
với mỗi anchor box, ta cần dự đoán 2 loại thông tin:
- classfication: anchor box đó có chứa object hay không hoặc là object thuộc class nào 
- các giá trị để chỉnh toạ độ bounding box trên ảnh gốc lại sao cho khớp với [[Ground Truth]] 
![[Pasted image 20261106215554.png]]