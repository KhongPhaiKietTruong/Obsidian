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

chương 2.3:
preemtive schedule (điều phối ưu tiên): một khi cpu được cấp cho một tiến trình, nó sẽ giữ phần cpu đó cho đến khi hoàn thành
non-preemtive:  cpu được cấp có thể bị thu hồi

turnaround time: thời gian để hoàn thành một tiến trình
waiting time: tổng thời gian một tiến trình phải chờ để được cấp phát cpu
response time: 