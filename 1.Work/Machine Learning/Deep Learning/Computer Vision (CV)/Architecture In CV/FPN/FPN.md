viết tắt của: Feature Pyramid Network

## Định Nghĩa 
FPN là một kiến trúc [[Neural Network]], dùng để tạo ra [[Feature Map]] ở nhiều độ phân giải khác nhau 

FPN được sinh ra để khắc phục hạn chế của mạng CNN:
- F ở tầng sâu mang thông tin ngữ nghĩa cao nhưng độ phân giải lại thấp 
- F ở tầng nông mang thông tin ngữ nghĩa thấp nhưng độ phân giải cao 
nếu sử dụng F ở tầng sâu thì ta có thể phân biệt đối tượng nhưng khó để phát hiện đối tượng có kích thước nhỏ 

FPN giải quyết vấn đề này bằng cách kết hợp thông tin của nhiều F lại với nhau 

## Cấu Trúc Mạng 
FPN gồm hai nhánh chính:
- bottom-up pathway: là quá trình tích chập bình thường 
- top-down pathway: chọn F sâu nhất để bắt đầu, thực hiện [[Upsampling]] lên F đó 

## Công Dụng
- phát hiện vật thể ở nhiều kích thước khác nhau 
--- 
F: feature map 
