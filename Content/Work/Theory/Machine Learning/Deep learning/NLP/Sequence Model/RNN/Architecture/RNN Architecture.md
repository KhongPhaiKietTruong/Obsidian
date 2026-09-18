mỗi ô có ỹ nghĩa là "biết được thông tin tất cả những từ ở **vị trí hiện tại** đảo về trước, xác suất của tất cả các từ trong vocabulary có thể xuất hiện ở vị trí **tiếp theo** là gì"

ở mỗi vị trí, thì ta truyền vào giá trị $y^{<t-1>}$ là [[Target Value]] tại vị trí nằm trước vị trí hiện tại, $a^{<t-1>}$ là tóm tắt thông tin của các timestamp trước từ đó ta tính được [[Pre-activation Value z]] của vị trí hiện tại 

hàm loss được sử dụng trong RNN là [[Category Cross Entropy - Softmax Loss]] 