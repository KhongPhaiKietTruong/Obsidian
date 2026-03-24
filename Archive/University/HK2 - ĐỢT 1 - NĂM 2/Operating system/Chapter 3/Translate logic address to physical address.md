quá trình này được thực hiện bởi [[MMU]]
các bước thực hiện:
```
Bước 1: Tách địa chỉ logic <p, d>
         CPU phát ra → lấy p và d riêng ra

Bước 2: Dùng p tra page table → lấy frame number f

Bước 3: Thay p bằng f → địa chỉ vật lý = <f, d>
```
ví dụ:
```
Bước 1: p = 2, d = 50
Bước 2: tra page table → page 2 nằm ở frame 3
Bước 3: địa chỉ vật lý = <frame 3, offset 50>
```