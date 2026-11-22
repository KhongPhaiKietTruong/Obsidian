## Định Nghĩa 
Adapter là một thành phần trung gian giữa dữ liệu và giao diện, có nhiệm vụ lấy dữ liệu từ nguồn và đưa dữ liệu đó cho giao diện hiển thị lên (gắn từng mẫu dữ liệu vào từng view tương ứng)

giả sử ta có 
```java
List<Product> products = new ArrayList<>();

products.add(new Product("Laptop", 15000000));

```
java không biết rằng ta phải đưa "laptop" hay 15tr vào TextView nào, adapter giúp giải quyết việc này 