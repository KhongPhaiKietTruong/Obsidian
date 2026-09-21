kí hiệu: \_\_<tên_method>\_\_()

là những [[Method (Phương thức)]] đặc biệt được tự động gọi tùy trường hợp
những method này định nghĩa những cách mà [[Class (Lớp)]] đó phản ứng đối với hành động của ngôn ngữ lập trình

ví dụ như cộng hai số, ta sẽ phải định nghĩa method là \_\_add__() (method này dành cho hành động "+")  cho datatype int (là một class), khi đó ta cộng hai số có kiểu int thì nó sẽ gọi đến magic method này và trả về cho ta tổng của hai số dó

tuy nhiên, giả sử ta có class là vector, có hai vector a và b cộng nhau, thì lúc này ta phải định nghĩa magic method \_\_add__() của class vector đó để ta có thể thực hiện được phép cộng hai vector bằng dấu "+"

có thể thấy, cùng một dấu "+" nhưng ta có thể thực hiện được nhiều điều, đó là nhờ vào magic method, đây cũng chính là [[Polymorphism (Tính đa hình)]] 