là kĩ thuật giúp phân chia các mẫu vào tập con theo đúng tỉ lệ phân phối các lớp của chúng, 

ví dụ:
giả sử một dataset có 2 lớp là A chiếm 95% và B chiếm 5%, khi thực hiện chia dataset đó thành hai tập train và test, rất có khả năng tất cả mẫu của lớp B sẽ đi vào tập B mà không có trong tập test, stratified split giúp việc không xảy ra bằng cách chia sao cho tập train có cả lớp A và B với tỉ lệ mẫu 95% và 5% giống tập cha và tập test cũng vậy


> [!NOTE] 
> Stratified áp dụng được cho dataset nhiều lớp chứ không phải chỉ hai lớp
