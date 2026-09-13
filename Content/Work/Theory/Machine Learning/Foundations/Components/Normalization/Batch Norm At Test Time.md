trong [[Inference - Test time]], [[Batch Norm]] sẽ không hoạt động giống như lúc train, khi ta truyền vào một mini-batch, thay vì sử dụng $\mu \text{ và }\sigma^2$ ([[Giá trị trung bình]] và [[Variance (Phương Sai)]]) của mini-batch đó thì thay vào đó ta sử dụng [[Exponentially Weighted Average (EWA)]] của $\mu \text{ và } \sigma^2$ của các mini-batch ta đã truyền vào 

lí do là vì