# SQL MOC (Map of Content)

> [!NOTE]
> Map of Content cho phần **SQL (Structured Query Language)**. Bao gồm các khái niệm, kiểu dữ liệu, các câu lệnh DDL, DML, DQL, toán tử, ràng buộc và hàm tổng hợp.

## 🧭 Khái niệm cơ bản (Concepts)
- [[Table (Bảng)]]
- [[Records (Bảng ghi)]]
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
- [[tạo database]]
- [[USE]]
- [[tạo table]]
- [[ALTER TABLE]]
  - [[ADD]]
  - [[MODIFY]]
  - [[DROP]]
  - [[RENAME]]
- [[SHOW]]
- [[DESCRIBE (DESC)]]

## ✍️ Thao tác dữ liệu (DML - Data Manipulation Language)
- [[INSERT INTO]]
- [[UPDATE]]
- [[Content/Work/Databases/Relational Database/SQL/COMMANDS/SET]]
- [[DELETE FROM]]

## 🔍 Truy vấn dữ liệu (DQL - Data Query Language)
- [[DISTINCT]]
- [[WHERE]]
- [[GROUP BY]]
- [[HAVING]]
- [[ORDER BY]]
- [[LIMIT]]

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
- [[FOREIGN KEY]]
- [[CONSTRAINTS/DEFAULT|DEFAULT]]
- [[CONSTRAINTS/AUTO_INCREMENT|AUTO_INCREMENT]]

### Khóa ngoại & Hành vi (Foreign Key Behaviors)
- [[ON DELETE CASCADE]]
- [[ON DELETE SET NULL]]
- [[ON UPDATE CASCADE]]

## 🧮 Hàm tổng hợp (Aggregate Functions)
- [[FUNCTION/COUNT()|COUNT()]]
- [[Content/Work/Databases/Relational Database/SQL/FUNCTION/SUM()|SUM()]]
- [[FUNCTION/AVG()|AVG()]]

## 📑 Phép toán tập hợp (Set Operations)
- [[UNION]]
- [[INTERSECT]]
- [[EXCEPT]]

## 📄 Tài nguyên thực hành (Scripts)
- [[Script.sql]]

---
Tag: #moc #sql #database
