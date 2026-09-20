## Định Nghĩa 

là một giải pháp thay thế cho greedy, tại mỗi timestamp, ta lưu lại B (Beam Width) [[Partial Sequences]] có [[Cumulative Score]] cao nhất thay vì chỉ chọn token có xác suất cao nhất  

giả sử ta có b=3, 
ở time step 1: ta chọn được 3 phần tử là \["i", "we", "you"] là ba cái partial sequences có cumulative score cao nhất
ở time step 2: ta chọn được 3 phần tử mới là \["i love", "I am", "you are"] cũng là partial sequences có điểm cao nhất từ một tập hợp của các partial sequnce như I:\["I am", "I love", "I need", ...], we:\["we were", "we want", "we are", "we shoot], tương tự với "you", nghĩa là, với mỗi phần tử nằm trong beam, ta có n ứng viên (n là số phần tử trong [[Vocabulary]]), vậy là ở mỗi time step, ta phải chọn ra b phần tử có điểm cao nhất từ n\*b phần tử 

một điều nữa là để tìm được xác suất từ tiếp theo của mỗi phần tử trong beam thì ta dùng [[Encoder]] và [[Decoder]] (t (t là time step) output ra)
![[Pasted image 20260920150602.png]]
>beam search với beam width = 1 chính là greedy 

## Hyperparameter b
nếu chọn b to thì ta có được kết quả tốt hơn nhưng chậm hơn
b nhỏ thì kết quả ít tốt hơn nhưng nó nhanh 