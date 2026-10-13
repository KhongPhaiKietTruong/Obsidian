cũng giống như [[Primary Data File (.mdf)]] nhưng file này nằm ở một [[Filegroup]] khác filegroup mặc định

ví dụ ta tạo một [[Table (Bảng)]] mà không chỉ định filegroup thì mặc định primary data file sẽ chứa table đó 
nếu ta chỉ định một filegroup khác thì file chứa table đó sẽ là ndf và nằm ở filegroup được chỉ định  