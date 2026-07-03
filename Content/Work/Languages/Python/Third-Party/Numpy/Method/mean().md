dùng để tính giá trị trung bình

giả sử a = \[1, 2, 3, 4, 5]
print(np.mean(a))
output : 7.5 (trung bình cộng tất cả phần tử trong mảng)

nếu ta thêm tham số axis vào hàm thì nó sẽ tính theo hàng hoặc cột (axis = 1 hay 0 tương ứng)
giả sử ta có a = \[\[1, 2], \[3, 4]\]

print(np.mean(a, axis=0))
output: \[2, 3]

print(np.mean(a, axis=1))
output: \[1.5, 3.5]