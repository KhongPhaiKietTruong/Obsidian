# SQL MOC (Map of Content)

> [!NOTE]
> Map of Content cho phần **SQL (Structured Query Language)**. Bao gồm các khái niệm, kiểu dữ liệu, các câu lệnh chuẩn DDL, DML, DQL, Set Operations, toán tử, ràng buộc và các hàm tổng hợp.

## 🧭 Khái niệm cơ bản (Concepts)
- [[Table (Bảng)|Table (Bảng)]]
- [[Records (Bảng ghi)|Records (Bản ghi)]]
- [[1NF|1NF (Chuẩn hóa 1)]]
- [[2NF|2NF (Chuẩn hóa 2)]]
- [[3NF|3NF (Chuẩn hóa 3)]]
- [[Super Key|SUPER KEY (Khóa siêu cấp)]]
- [[Candidate Key (Khóa ứng viên)|CANDIDATE KEY (Khóa ứng viên)]]
- [[Primary key (Khóa chính)|PRIMARY KEY (Khóa chính - Khái niệm)]]

## 📊 Kiểu dữ liệu (Datatypes)
- [[INT|INT]]
- [[DECIMAL(M, N)|DECIMAL(M, N)]]
- [[CHAR(N)|CHAR(N)]]
- [[VARCHAR(N)|VARCHAR(N)]]
- [[BLOB|BLOB]]
- [[DATE|DATE]]
- [[TIMESTAMP|TIMESTAMP]]

## 🛠️ Định nghĩa dữ liệu (DDL - Data Definition Language)
- [[Tạo database|CREATE DATABASE (Tạo database)]]
- [[Tạo bảng|CREATE TABLE (Tạo table)]]
- [[ALTER TABLE|ALTER TABLE]]
  - [[Thêm cột vào bảng|ADD (Thêm cột / ràng buộc)]]
- [[Xóa một đối tượng|DROP (Xóa bảng / database)]]
- [[Xóa tất cả dữ liệu trong bảng nhưng vẫn giữ cấu trúc bảng|TRUNCATE TABLE (Xóa dữ liệu, giữ cấu trúc)]]

## ✍️ Thao tác dữ liệu (DML - Data Manipulation Language)
- [[INSERT INTO|INSERT INTO]]
- [[UPDATE|UPDATE]]
- [[Content/Work/Databases/Relational Database/SQL/COMMANDS/DML - Data Manipulation Language (Ngôn Ngữ Thao Tác Dữ Liệu)/SET|SET]]
- [[Xóa các bảng ghi thỏa điều kiện|DELETE FROM]]

## 🔍 Truy vấn dữ liệu (DQL - Data Query Language)
- [[DISTINCT|DISTINCT]]
- [[WHERE|WHERE]]
- [[GROUP BY|GROUP BY]]
- [[HAVING|HAVING]]
- [[ORDER BY|ORDER BY]]
- [[LIMIT|LIMIT (Vendor Extension / MySQL / Postgres)]]

## 📑 Phép toán tập hợp (Set Operations)
- [[COMMANDS/Set Operations/UNION|UNION]]
- [[COMMANDS/Set Operations/INTERSECT|INTERSECT]]
- [[COMMANDS/Set Operations/EXCEPT|EXCEPT]]

## ⚙️ Toán tử & Ký tự đại diện (Operators & Wildcards)
### Toán tử (Operators)
- [[AND|AND]]
- [[OR|OR]]
- [[NOT|NOT]]
- [[IN|IN]]
- [[BETWEEN|BETWEEN]]
- [[LIKE|LIKE]]
- [[IS & IS NOT|IS & IS NOT]]
- [[1. Work/Databases/Relational Database/SQL/OPERATOR/ĐỘ ƯU TIÊN TOÁN TỬ|Độ ưu tiên toán tử]]

### Ký tự đại diện (Wildcards)
- [[1. Work/Databases/Relational Database/SQL/WILDCARDS/%|% (Bất kỳ ký tự nào)]]
- [[_|_ (Một ký tự bất kỳ)]]
- [[ngoặc vuông|[ ] (Tập hợp ký tự)]]
- [[dấu mũ|[^] (Phủ định tập hợp ký tự)]]

## 🔐 Ràng buộc dữ liệu (Constraints)
- [[Khai báo ràng buộc|Khai báo ràng buộc]]
- [[Quy tắc đặt tên ràng buộc|Quy tắc đặt tên ràng buộc]]
- [[Not null|not null]]
- [[Unique|Unique]]
- [[Primary Key|PRIMARY KEY (Ràng buộc khóa chính)]]
- [[Foreign Key (Khóa Ngoại)|FOREIGN KEY (Khóa ngoại)]]
- [[Default|Default]]
- [[Auto_increment|Auto_increment]]

### Khóa ngoại & Hành vi (Foreign Key Behaviors)
- [[ON DELETE CASCADE|ON DELETE CASCADE]]
- [[ON DELETE SET NULL|ON DELETE SET NULL]]
- [[ON UPDATE CASCADE|ON UPDATE CASCADE]]

## 🧮 Hàm tổng hợp (Aggregate Functions)
- [[1. Work/Databases/Relational Database/SQL/FUNCTION/COUNT()|COUNT()]]
- [[1. Work/Databases/Relational Database/SQL/FUNCTION/SUM()|SUM()]]
- [[AVG()|AVG()]]

## 🐬 Lệnh riêng cho MySQL (MySQL Dialect / CLI)
*(Nằm trong thư mục `Databases/DBMS/MySQL/`)*
- [[USE|USE]]
- [[SHOW|SHOW]]
- [[DESCRIBE (DESC)|DESCRIBE (DESC)]]
- [[MODIFY|MODIFY]]
- [[RENAME|RENAME]]

## 📄 Tài nguyên thực hành (Scripts)
- [[Script.sql]]

---
Tag: #moc #sql #database
