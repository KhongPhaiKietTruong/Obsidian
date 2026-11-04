Đây là các file mang dữ liệu ở dạng văn bản dễ đọc như các thông số cấu hình
f
```toml
# File cấu hình mẫu: config.toml
title = "Microservice Config"

[server]
host = "127.0.0.1"
port = 8080
enable_tls = true
timeout = 30.5

[database.credentials]
user = "admin"
ports = [5432, 5433]

# Bảng lồng nhau dạng danh sách (Array of Tables)
[[plugins]]
name = "auth"
enabled = true

[[plugins]]
name = "logger"
enabled = false
```