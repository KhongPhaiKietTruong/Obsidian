Nếu các [[1.Work/OOP/Theory/Class]] là bản thiết kế để tạo ra các [[1.Work/OOP/Theory/Object]] thì abstract class chính là bản thiết kế để tạo ra các class  
đặc điểm của các abstract class:
- Abstract Class không thể tạo ra các đối tượng mà chỉ có thể để các class khác [[Inheritance|kế thừa]] nó 
- trong abstract class có thể chứa các [[Attribute]] hoặc [[Method]] như một class bình thường và còn có các method đặc biệt là [[Abstract Method]]

> [!NOTE] 
> Một [[Subclass]] kế thừa từ một Abstract Class bắt buộc phải định nghĩa lại toàn bộ Abstract Method nằm trong Abstract Class, nếu không thì subclass đó vẫn tiếp tục là một abstract class cho tới khi toàn bộ abstract method được định nghĩa hết 

--- 
xem thêm:
- [[Interface vs Abstract Class]] 