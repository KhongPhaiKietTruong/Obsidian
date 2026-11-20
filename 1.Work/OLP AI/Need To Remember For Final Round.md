nn.Conv2d(in_channels, out_channels, 3, 1, 1) là same conv 

nn.TranposeConv2d(in_channels, out_channels, 2, 2) tăng spatial size lên gấp đôi 

thư viện opencv làm việc mới mảng numpy (cv2.imread cho ra mảng numpy)

opencv mặc định sử dụng BGR còn các thư viện khác đều sử dụng RGB 

DataLoader nhận vào Dataset object 

Image.size (trong PIL) trả về (W, H) chứ không phải (H, W)

khi áp dụng [[Class-Weighted Loss]], tensor weight cần được đặt trên cuda 

SSL: semi and self supervised learning 
