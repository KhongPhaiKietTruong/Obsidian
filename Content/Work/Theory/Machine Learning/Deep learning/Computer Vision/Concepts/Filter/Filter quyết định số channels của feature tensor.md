số lượng [[Filter|filter]] ở lớp **hiện tại** sẽ quyết định **số channel** của **feature tensor** của **lớp hiện tại**  

hiểu đơn giản là mỗi lần ta tính [[Convolve (Tích Chập)|tích chập]] lên ma trận gốc, nó sẽ cho ra **một** [[Feature Map]] có **số channel là 1**, vậy thì với **n filtler** thì ta có **n feature map** với **channel = 1** 

**feature tensor** của ta sẽ là **ghép của n feature map** đó lại, tức là, **feature tensor** matrix đó sẽ có **số channels là n** 