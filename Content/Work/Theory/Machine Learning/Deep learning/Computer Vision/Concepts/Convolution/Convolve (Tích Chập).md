kí hiệu trong toán học là * 

là phép toán mà một ma trận được gọi là [[Filter]] sẽ "trượt" trên ma trận gốc (hình ảnh) và tính tổng có trọng số tại mỗi vị trí 

công thức:
$$
Y(i,j) = \sum_m \sum_n X(i+m, j+n)K(m,n)
$$
kích thước của các ma trận trong phép tích chập:
$$
(n,n)\times(f,f)=\left( \lfloor \frac{n+2p-f}{s} +1 \rfloor,\lfloor \frac{n+2p-f}{s} +1 \rfloor \right)
$$
với:
- p: [[Padding Size]] 
- s: [[Stride (Bước Trượt)]] 
![[Pasted image 20260915135043.png]]

> lưu ý: để thực hiện được phép tính tích chập thì số channels của filter và số channels của ma trận gốc sẽ phải bằng nhau 