dùng để áp dụng một hàm tự định nghĩa (hoặc hàm lambda) lên các [[Series]] của [[DataFrame]].

* **Khi axis = 1**: Truyền từng **hàng** (dưới dạng một Series) vào hàm xử lý. Thích hợp khi cần tính toán giữa các cột trong cùng một hàng.
* **Khi axis = 0 (mặc định)**: Truyền từng **cột** (dưới dạng một Series) vào hàm xử lý.

Ví dụ:
```python
# 1. Định nghĩa hàm xử lý trên một hàng (axis=1)
def check_nguoi_yeu(row):
    if row['nguoi yeu'] == 1:
        return f"{row['ten']} đã có người yêu"
    else:
        return f"{row['ten']} còn độc thân"

# Áp dụng hàm lên từng hàng
df['trang_thai'] = df.apply(check_nguoi_yeu, axis=1)

# 2. Sử dụng lambda để tính toán nhanh
df['tuoi_nhan_doi'] = df['tuoi'].apply(lambda x: x * 2)
```