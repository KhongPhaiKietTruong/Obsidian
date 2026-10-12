cấu trúc đầy đủ gồm try except else finally
```python
try:
    # 1. Code này có thể gây lỗi
    a = int(input("Nhập số bị chia: "))
    b = int(input("Nhập số chia: "))
    ket_qua = a / b

except ZeroDivisionError:
    # 2. Chạy nếu người dùng chia cho 0
    print("Lỗi: Không thể chia một số cho 0!")

except Exception as e:
    # 4. Chạy với mọi lỗi khác chưa lường trước
    print(f"Đã xảy ra lỗi không xác định: {e}")

else:
    # 5. Chạy nếu KHÔNG có lỗi nào xảy ra
    print(f"Kết quả phép chia là: {ket_qua}")

finally:
    # 6. Luôn luôn chạy (dù lỗi hay không)
    print("--- Chương trình kết thúc ---")
```
