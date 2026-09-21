![[Pasted image 20260114055218.png]]

## Quy trình làm việc & Các trạng thái của file trong Git

Git quản lý các file thông qua ba vùng lưu trữ cục bộ (Local) và một vùng lưu trữ từ xa (Remote), tương ứng với các trạng thái khác nhau của file:

### 1. Working Directory (Thư mục làm việc)
* **Trạng thái**: `new` (mới) / `modified` (đã chỉnh sửa)
* **Mô tả**: Thư mục làm việc hiện tại trên máy tính của bạn, nơi bạn tạo mới và chỉnh sửa các file. Các thay đổi ở đây chưa được Git theo dõi hoặc chưa sẵn sàng để commit.

### 2. Staging Area (Vùng chuẩn bị)
* **Trạng thái**: `staged` (đã đưa vào vùng chờ)
* **Mô tả**: Nơi lưu giữ tạm thời các thay đổi từ Working Directory mà bạn muốn đưa vào lần commit tiếp theo.
* **Lệnh để đưa vào staging**:
  ```bash
  git add <tên_file>
  ```

### 3. Local Repository (Kho lưu trữ cục bộ)
* **Trạng thái**: `committed` (đã commit)
* **Mô tả**: Cơ sở dữ liệu cục bộ trên máy của bạn, nơi Git lưu trữ lịch sử phiên bản. Khi đã commit, các thay đổi của bạn sẽ được lưu lại một cách an toàn.
* **Lệnh để commit**:
  ```bash
  git commit -m "Thông điệp commit"
  ```
