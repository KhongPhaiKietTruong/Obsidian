Dùng để thiết lập tính module cho code, nó là một bản quy ước để định nghĩa xem một [[Class (Lớp)]] có thể làm được gì chứ không định nghĩa cụ thể là làm như thế nào (bên trong interface chỉ để tên các [[Function (Hàm)]] chứ không có nội dung bên trong hàm, các class khi thực hiện giao diện đó thì mới định nghĩa từng hàm thực hiện như nào), một class có thể thực hiện nhiều giao diện khác nhau

sự khác biệt giữa interface và [[Abstract Class (Lớp trừu tượng)|lớp trừu tượng]] nằm ở mối quan hệ của chúng với các class
- interface định nghĩa các "khả năng", class nào có khả năng đó thì sẽ thực hiện các interface tương ứng (mối quan hệ can-do), các lớp không liên quan đến nhau nhưng có thể thực hiện chung một interface
- lớp trừu tượng thì định nghĩa một lớp cha, và các class con có chung nguồn gốc từ class cha đó (is-a)

# ví dụ: 
### Trường hợp dùng Abstract Class (Gốc gác chung - "Is-A")

Bạn có các lớp: `Dog`, `Cat`, `Lion`. Tất cả chúng đều thuộc dòng họ **Động vật (Animal)**. Chúng có chung các thuộc tính như `color`, `age` và hành vi `eat()`. Lúc này, bạn tạo một Abstract Class:

```java
abstract class Animal {
    String color; // Có thuộc tính lưu trạng thái
    
    void eat() {
        System.out.println("Eating..."); // Phương thức có sẵn code xử lý chung
    }
    
    abstract void makeSound(); // Phương thức bắt buộc các con phải tự định nghĩa
}
```

> `Dog` **IS A (là một)** `Animal`. `Cat` **IS A** `Animal`. Chúng không thể kế thừa thêm họ khác (như họ Máy móc).

### Trường hợp dùng Interface (Khả năng - "Can-Do")

Bây giờ, bạn muốn thêm khả năng **"Biết bay" (Flyable)**. Trong hệ thống của bạn có: `Bird` (Con chim), `Airplane` (Máy bay), và `Superman` (Siêu nhân).

- Con chim thuộc họ Động vật.
- Máy bay thuộc họ Phương tiện giao thông.
- Siêu nhân thuộc họ Con người.

Chúng thuộc 3 dòng họ (Abstract Class) hoàn toàn khác nhau, không thể gộp chung gốc được. Nhưng chúng đều **có khả năng bay**. Lúc này bạn dùng Interface:

```java 
interface Flyable {
    void fly(); // Quy định hành vi bay
}
```

Lớp `Bird` lúc này sẽ vừa thừa kế từ họ Động vật, vừa triển khai khả năng bay:

```java 
class Bird extends Animal implements Flyable {
    void makeSound() { System.out.println("Chirp"); }
    public void fly() { System.out.println("Bird is flying..."); }
}
```