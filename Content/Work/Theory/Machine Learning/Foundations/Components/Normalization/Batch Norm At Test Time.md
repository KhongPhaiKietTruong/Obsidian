trong [[ìne]], batch norm sẽ không hoạt động giống như lúc train, khi ta truyền vào một mini-batch, thay vì sử dụng $\mu \text{ và }\sigma^2$ của mini-batch đó thì thay vào đó ta sử dụng [[Exponentially Weighted Average (EWA)]] của $\mu \text{ và } \sigma^2$ của các mini-batch ta đã truyền vào 

lí do là vì