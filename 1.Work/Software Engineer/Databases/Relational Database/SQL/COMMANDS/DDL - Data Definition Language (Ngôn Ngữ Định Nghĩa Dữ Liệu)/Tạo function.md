
cú pháp (trong T-SQL)
```sql
create or alter fn_my_function (
​	@<tên_tham_số> <kiểu_dữ_liệu> [= <giá_trị_mặc_định>],
​	...
) returns <kiểu_trả_về>
as begin
​	<code>
end;
```

lưu ý: khi sử dụng một function do mình tạo ra, buộc phải chỉ rõ tên [[Schema]] 