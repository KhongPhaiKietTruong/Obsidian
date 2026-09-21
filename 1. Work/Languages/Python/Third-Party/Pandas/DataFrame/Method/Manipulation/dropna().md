hàm này trả về một [[DataFrame]] mới sau khi đã xóa tất cả những dòng có dữ liệu bị rỗng (NaN).

Các tham số phổ biến:
* inplace=True: Thay đổi trực tiếp trên DataFrame hiện tại thay vì trả về DataFrame mới.
* subset=['ten_cot']: Chỉ kiểm tra các giá trị NaN trên các cột được chỉ định để quyết định xóa dòng.
* how='all': Chỉ xóa dòng nếu tất cả các giá trị của dòng đó đều là NaN (mặc định là how='any').

Ví dụ:
```python
# Xóa tất cả các hàng chứa ít nhất một giá trị NaN
df_cleaned = df.dropna()

# Chỉ xóa hàng nếu cột 'tuoi' bị NaN, thay đổi trực tiếp trên df
df.dropna(subset=['tuoi'], inplace=True)
```
