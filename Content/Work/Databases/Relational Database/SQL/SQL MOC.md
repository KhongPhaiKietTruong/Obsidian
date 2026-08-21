# SQL MOC (Map of Content)

> [!NOTE]
> Map of Content cho phần **SQL (Structured Query Language)**. Bao gồm các khái niệm, kiểu dữ liệu, các câu lệnh chuẩn DDL, DML, DQL, Set Operations, toán tử, ràng buộc và các hàm tổng hợp.

## 🧭 Khái niệm cơ bản (Concepts)
- [[CONCEPTS/Table (Bảng)|Table (Bảng)]]
- [[CONCEPTS/Records (Bảng ghi)|Records (Bản ghi)]]
- [[CONCEPTS/1NF|1NF (Chuẩn hóa 1)]]
- [[CONCEPTS/2NF|2NF (Chuẩn hóa 2)]]
- [[CONCEPTS/3NF|3NF (Chuẩn hóa 3)]]
- [[CONCEPTS/SUPER KEY|SUPER KEY (Khóa siêu cấp)]]
- [[CONCEPTS/CANDIDATE KEY|CANDIDATE KEY (Khóa ứng viên)]]
- [[CONCEPTS/PRIMARY KEY|PRIMARY KEY (Khóa chính - Khái niệm)]]

## 📊 Kiểu dữ liệu (Datatypes)
- [[DATATYPE/INT|INT]]
- [[DATATYPE/DECIMAL(M, N)|DECIMAL(M, N)]]
- [[DATATYPE/CHAR(N)|CHAR(N)]]
- [[DATATYPE/VARCHAR(N)|VARCHAR(N)]]
- [[DATATYPE/BLOB|BLOB]]
- [[DATATYPE/DATE|DATE]]
- [[DATATYPE/TIMESTAMP|TIMESTAMP]]

## 🛠️ Định nghĩa dữ liệu (DDL - Data Definition Language)
- [[COMMANDS/DDL/tạo database|CREATE DATABASE (Tạo database)]]
- [[COMMANDS/DDL/tạo table|CREATE TABLE (Tạo table)]]
- [[COMMANDS/DDL/ALTER TABLE|ALTER TABLE]]
  - [[COMMANDS/DDL/ADD|ADD (Thêm cột / ràng buộc)]]
- [[COMMANDS/DDL/Xóa một đối tượng (DROP)|DROP (Xóa bảng / database)]]
- [[COMMANDS/DDL/Xóa tất cả dữ liệu trong bảng nhưng vẫn giữ cấu trúc bảng (TRUNCATE TABLE )|TRUNCATE TABLE (Xóa dữ liệu, giữ cấu trúc)]]

## ✍️ Thao tác dữ liệu (DML - Data Manipulation Language)
- [[COMMANDS/DML/INSERT INTO|INSERT INTO]]
- [[COMMANDS/DML/UPDATE|UPDATE]]
- [[COMMANDS/DML/SET|SET]]
- [[COMMANDS/DML/DELETE FROM|DELETE FROM]]

## 🔍 Truy vấn dữ liệu (DQL - Data Query Language)
- [[COMMANDS/DQL/DISTINCT|DISTINCT]]
- [[COMMANDS/DQL/WHERE|WHERE]]
- [[COMMANDS/DQL/GROUP BY|GROUP BY]]
- [[COMMANDS/DQL/HAVING|HAVING]]
- [[COMMANDS/DQL/ORDER BY|ORDER BY]]
- [[COMMANDS/DQL/LIMIT|LIMIT (Vendor Extension / MySQL / Postgres)]]

## 📑 Phép toán tập hợp (Set Operations)
- [[COMMANDS/Set Operations/UNION|UNION]]
- [[COMMANDS/Set Operations/INTERSECT|INTERSECT]]
- [[COMMANDS/Set Operations/EXCEPT|EXCEPT]]

## ⚙️ Toán tử & Ký tự đại diện (Operators & Wildcards)
### Toán tử (Operators)
- [[OPERATOR/AND|AND]]
- [[OPERATOR/OR|OR]]
- [[OPERATOR/NOT|NOT]]
- [[OPERATOR/IN|IN]]
- [[OPERATOR/BETWEEN|BETWEEN]]
- [[OPERATOR/LIKE|LIKE]]
- [[OPERATOR/IS & IS NOT|IS & IS NOT]]
- [[OPERATOR/ĐỘ ƯU TIÊN TOÁN TỬ|Độ ưu tiên toán tử]]

### Ký tự đại diện (Wildcards)
- [[WILDCARDS/%|% (Bất kỳ ký tự nào)]]
- [[WILDCARDS/_|_ (Một ký tự bất kỳ)]]
- [[WILDCARDS/ngoặc vuông|[ ] (Tập hợp ký tự)]]
- [[WILDCARDS/dấu mũ|[^] (Phủ định tập hợp ký tự)]]

## 🔐 Ràng buộc dữ liệu (Constraints)
- [[CONSTRAINTS/Khai báo ràng buộc|Khai báo ràng buộc]]
- [[CONSTRAINTS/Quy tắc đặt tên|Quy tắc đặt tên ràng buộc]]
- [[CONSTRAINTS/NOT NULL|NOT NULL]]
- [[CONSTRAINTS/UNIQUE|UNIQUE]]
- [[CONSTRAINTS/PRIMARY KEY|PRIMARY KEY (Ràng buộc khóa chính)]]
- [[CONSTRAINTS/FOREIGN KEY|FOREIGN KEY (Khóa ngoại)]]
- [[CONSTRAINTS/DEFAULT|DEFAULT]]
- [[CONSTRAINTS/AUTO_INCREMENT|AUTO_INCREMENT]]

### Khóa ngoại & Hành vi (Foreign Key Behaviors)
- [[CONSTRAINTS/ON DELETE CASCADE|ON DELETE CASCADE]]
- [[CONSTRAINTS/ON DELETE SET NULL|ON DELETE SET NULL]]
- [[CONSTRAINTS/ON UPDATE CASCADE|ON UPDATE CASCADE]]

## 🧮 Hàm tổng hợp (Aggregate Functions)
- [[FUNCTION/COUNT()|COUNT()]]
- [[FUNCTION/SUM()|SUM()]]
- [[FUNCTION/AVG()|AVG()]]

## 🐬 Lệnh riêng cho MySQL (MySQL Dialect / CLI)
*(Nằm trong thư mục `Databases/DBMS/MySQL/`)*
- [[Databases/DBMS/MySQL/USE|USE]]
- [[Databases/DBMS/MySQL/SHOW|SHOW]]
- [[Databases/DBMS/MySQL/DESCRIBE (DESC)|DESCRIBE (DESC)]]
- [[Databases/DBMS/MySQL/MODIFY|MODIFY]]
- [[Databases/DBMS/MySQL/RENAME|RENAME]]

## 📄 Tài nguyên thực hành (Scripts)
- [[Script.sql]]

---
Tag: #moc #sql #database
