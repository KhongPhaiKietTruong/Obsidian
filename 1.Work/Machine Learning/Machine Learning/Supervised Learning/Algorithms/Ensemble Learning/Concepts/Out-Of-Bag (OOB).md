
OOB là một tập dữ liệu con mà không bao giờ được chọn khi thực hiện [[Bagging - Sampling with replacement]] 

Nếu tập dữ liệu có $N$ mẫu và ta rút $N$ lần có hoàn lại: Xác suất 1 mẫu không được chọn trong 1 lần rút là: $1 - \frac{1}{N}$Xác suất mẫu đó không được chọn qua toàn bộ $N$ lần rút là:$$\left(1 - \frac{1}{N}\right)^N$$Khi $N$ đủ lớn:$$\lim_{N \to \infty} \left(1 - \frac{1}{N}\right)^N = \frac{1}{e} \approx 0.368 \ (36.8\%)$$Nghĩa là trung bình mỗi cây quyết định chỉ học trên khoảng 63.2% dữ liệu, còn lại ~37% dữ liệu OOB hoàn toàn xa lạ đối với cây đó.