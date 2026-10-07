trong các đại lượng để đánh giá một model, ta sẽ chọn ra các đại lượng mà chỉ cần thỏa một điều kiện nào đó thôi, chứ không cần cố gắng tối ưu nó nhất có thể
ví dụ như: thời gian inference chỉ cần < 100 ms là oke, không cần phải chọn model mà có chỉ số đó nhỏ nhất (lưu ý là còn xét các đại lượng đánh giá khác nữa, điển hình là [[Optimizing Metric]])
![[Pasted image 20260914150527.png]]
trong ảnh thì ta sẽ chọn model B, vì cả 80ms và 95ms đều đã thỏa đk là < 100 ms, ta cần chọn model có chỉ số optimizing nhỏ nhất (tức B)