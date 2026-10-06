viết tắt của: Gaussian Error Linear Unit ![[Pasted image 20260922172424.png]]là một [[Activations]] có sự kết hợp giữa [[ReLU]] và [[Drop Out]] 

## Đặc điểm
- smooth hơn [[ReLU]] 
- input là số dương thì gelu là [[Idenity Function]] còn input là âm càng bé thì giá trị output càng tiến về 0 (xấp xỉ)
## Ưu Điểm 
- Không bị [[Dying Relu]] 
## Sử Dụng 
- thường được sử dụng trong các [[Transformer Model]] hiện đại 