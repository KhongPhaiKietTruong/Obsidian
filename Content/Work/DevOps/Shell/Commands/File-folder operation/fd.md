là lệnh dùng để tìm file hoặc folder theo tên
```
fd <pattern> <path> 
```
các lệnh thường dùng:
tìm file:
```
fd -t f <pattern>
```

tìm folder (directory):
```
fd -t d <pattern>
```

tìm file với phần extension cụ thể (phần sau dấu chấm)
```
#tim cac file .py 
fd -e py 
```