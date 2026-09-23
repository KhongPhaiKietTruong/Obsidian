
là một dạng của 
ý tưởng của SVR là chấp nhận những dự đoán trong khoảng sai số nhất định $\varepsilon$ so với giá trị thực sự 
```
    •  ← bị phạt

--------------------  f(x) + ε

      •     •
======== f(x) ========
   •         •

--------------------  f(x) - ε

   •  ← bị phạt
```

điểm khác biệt là so với Linear Regression (phạt với mọi điểm) thì SVR chỉ phạt những điểm nằm bên ngoài khoảng sai số đã định mà thôi 

lưu ý: model chỉ bị phạt bởi khoảng cách của mẫu bị phạt tới biên $f(x) \pm \varepsilon$ gần nhất mà thôi 