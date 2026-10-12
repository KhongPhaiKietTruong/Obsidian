## Định Nghĩa 
thực hiện chia sao cho phần chữ lấy ra là dài nhất khớp với từ trong [[Vocabulary]], đây cũng là hướng tiếp cận bottum up 

**Ví dụ 1**: Chia từ "playing"
Cỗ máy sẽ cố gắng nuốt trọn cả chữ trước, nếu không được mới nhả dần ra.
Nó xét toàn bộ từ: playing. Có trong từ điển không? -> Không.
Nó lùi lại 1 ký tự: playin. Có không? -> Không.
Nó lùi tiếp: playi. -> Không.
Nó lùi tiếp: play. -> Có!
👉 Mảnh cắt đầu tiên: play. Phần chữ còn thừa: ing.
Bây giờ xử lý phần thừa ing. Vì là phần đuôi, máy tự động ghép thêm ## vào để đem đi dò từ điển:
Xét toàn bộ phần thừa: ##ing. Có trong từ điển không? -> Có!
👉 Mảnh cắt thứ hai: ##ing. Hết chữ.
✅ Kết quả chia: ["play", "##ing"]