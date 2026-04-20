system call là các dịch vụ được OS cung cấp, và được truy cập thông qua api

có ba cách để truyền tham số cho system call: truyền vào thanh ghi, truyền theo block / table, truyền, truyền vào stack
 
 có 5 loại cấu trúc OS:
- đơn khối (monolithic) 
- nhiều lớp (layered) 
- vi nhân (microkernel) 
- module 
- hybrid 

chương 2.2: 
cấu trúc của một thread gồm: PC (program counter, register, stack) 
các thread của một tiến trình chia sẻ nhau: code, data, files 
