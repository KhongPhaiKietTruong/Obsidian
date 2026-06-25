import os

# Thay đường dẫn folder archive của bạn vào đây
folder_path = r"/home/kiettruong/Downloads/archive" 

print(f"{'Folder':<10} | {'Số lượng':<10}")
print("-" * 25)

total_images = 0

# Lấy danh sách folder và sắp xếp theo số (0, 1, 2... thay vì 0, 1, 10...)
subfolders = sorted(
    [d for d in os.listdir(folder_path) if os.path.isdir(os.path.join(folder_path, d))],
    key=lambda x: int(x) if x.isdigit() else x
)

for folder in subfolders:
    current_path = os.path.join(folder_path, folder)
    # Đếm file (bỏ qua file ẩn bắt đầu bằng dấu chấm)
    count = len([f for f in os.listdir(current_path) if not f.startswith('.')])
    
    print(f"{folder:<10} | {count:<10}")
    total_images += count

print("-" * 25)
print(f"TỔNG CỘNG : {total_images} ảnh")
