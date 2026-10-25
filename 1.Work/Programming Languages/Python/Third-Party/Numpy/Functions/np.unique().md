là hàm dùng để loại bỏ trùng lặp và trả về mảng chỉ chứa các giá trị riêng biệt đã tự sắp xếp (tăng dần hoặc theo thứ tự từ điển)
```python
arr = np.array([3, 1, 2, 3, 1, 4, 2])
unique_elements = np.unique(arr)

print(unique_elements)
# Output: [1 2 3 4] (Đã loại bỏ trùng lặp và sắp xếp tăng dần)
```