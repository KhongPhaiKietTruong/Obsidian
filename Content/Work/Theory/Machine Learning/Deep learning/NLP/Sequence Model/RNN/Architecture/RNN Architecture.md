mỗi ô có ỹ nghĩa là "biết được thông tin tất cả những từ ở **vị trí hiện tại** đảo về trước, xác suất của tất cả các từ trong vocabulary có thể xuất hiện ở vị trí **tiếp theo** là gì"

ở mỗi vị trí, thì ta truyền vào input là $y^{<t>}$ là [[Target Value]] tại vị trí ấy, $a^{<t-1>}$ (là thông tin các từ ở vị trí hiện tại đảo về trước) và $x^{<t>}$ (là từ ở vị trí hiện tại)