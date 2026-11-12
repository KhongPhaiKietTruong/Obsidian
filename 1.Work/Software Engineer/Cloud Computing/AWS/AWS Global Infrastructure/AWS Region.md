## Định Nghĩa 
AWS Region là một khu vực địa lí trên thế giới mà AWS xây dựng các cơ sở hạ tầng để cung cấp dịch vụ điện toán đám mây, đây cũng là những nơi mà người dùng chọn để đặt tài nguyên cloud của họ lên (như máy ảo, database, ...)

## Các Thành Phần
AWS Region gồm nhiều [[AZ - Availability Zone]] và mỗi AZ lại gồm nhiều data center 
```mermaid
flowchart TD
    A["AWS Global Infrastructure"]
    A --> B["AWS Region"]

    B --> C["Availability Zone 1"]
    B --> D["Availability Zone 2"]
    B --> E["Availability Zone 3"]

    C --> F["Data Center 1"]
    C --> G["Data Center 2"]

    D --> H["Data Center 3"]
    D --> I["Data Center 4"]

    E --> J["Data Center 5"]
    E --> K["Data Center 6"]

    style A fill:#232F3E,color:#fff
    style B fill:#FF9900,color:#000
```

## Đặc Điểm
- việc sao chép dữ liệu giữa các region phải được thực hiện bởi người dùng 