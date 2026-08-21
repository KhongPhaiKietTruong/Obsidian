dùng để gom các hàng có cùng giá trị ở một cột cụ thể rồi áp dụng hàm gộp lên từng nhóm đó
ví dụ:
![[Pasted image 20260317151824.png]]
```
SELECT MaSV, AVG(Diem)
FROM KQTHI
GROUP BY MaSV
```
![[Pasted image 20260317151842.png]]