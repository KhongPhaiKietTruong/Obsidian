dịch: chưa khớp, khớp dưới

đây là hiện tượng đồ thị mà model vẽ ra không khớp với các điểm dữ liệu, ví dụ như các điểm dữ liệu tuân theo một đường cong rõ ràng nhưng model lại chỉ kẻ ra một đường thẳng

##### Cách nhận biết underfitting:
- hiện tượng này có thể được nhận biết thông qua tính [[Train Error]] và [[Val Error - Dev Error]], khi train error sấp xỉ val error và cả hai đều ở mức cao thì model bị underfit (cao ở đây nghĩa là nó cao hơn [[Comparation With Human-level Performance]] ) 

một cách khác để biết mô hình có underfitting không là ta dựa trên [[Baseline Error]], nếu khoảng cách giữa training error và baseline error là lớn (training error > baseline error) thì nghĩa là mô hình ta đang bị underfitting 

hiện tượng này còn được gọi là high bias vì model mang định kiến rằng đường thẳng này là đủ để khớp các điểm mà không chịu uốn cong

xem thêm [[Mối quan hệ giữa Trainning Error và Validation Error trong Degree Of Polynominal]])