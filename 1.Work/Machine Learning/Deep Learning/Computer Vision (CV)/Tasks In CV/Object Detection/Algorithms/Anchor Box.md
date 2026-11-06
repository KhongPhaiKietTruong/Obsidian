Anchor Box dùng để giải quyết vấn đề trong một ô có đến nhiều điểm trung tâm của nhiều vật thể

ta định nghĩa sẵn n cái anchor box, rồi xét trong cái ô đó, gán anchor box đó cho vật thể có [[IoU - Intersection over Union]] của nó với anchor box cao nhất

>[!notes]
nếu ta sử dụng n anchor box thì với mỗi ô ảnh ta xét sẽ cho ra n bounding box dù cho ô ảnh đó có vật thể cần detect hay không (những bounding box trong ô ảnh không có vật thể sẽ có $p_{c}$ rất thấp)