set là một iterable không có thứ tự, không được đánh số, không thể thay đổi, có thể chứa nhiều kiểu dữ liệu cùng lúc và **không chứa giá trị lặp lại**
dùng {} để khai báo một set

- myset1 = {1, 2, 3, 4, 5}
  myset2 = \[6, 7]
  myset1.update(myset2)
  => { 1, 2, 3, 4, 5, 6, 7 }
- Note: update method accepts an iterable 
### Pop a element out of set 
- there are 2 ways: use **remove()** or **discard()**
- **remove(value)** or **discard(value)** 
- myset.discard(3); { 1, 2, 4, 5 }
- myset.remove(2); error!

### Unite two set | 
- Using .union(), parameters are one or multiple iterables
- x = {"apple", "banana", "cherry"}
- y = {"google", "microsoft", "apple"}
- z = x.union(y)
- => z = {"apple", "banana", "cherry", "google", "microsoft", 'apple'}

### Intersect two set &
-  Using intersection() or & operators to keep the mutual elements of two set 
- x = {"apple", "banana", "cherry"}
- y = {"google", "microsoft", "apple"}
- z = x.intersection(y)
- => z = {"apple"}

-  difference_update(<set>) is the same with difference() but it update to the current set
 - x = {"apple", "banana", "cherry"}
 - y = {"google", "microsoft", "apple"}
 - x.difference_update(y)

### Symmetric_difference ^
- x = {"apple", "banana", "cherry"}
- y = {"google", "microsoft", "apple"}
- z = x.symmetric_difference(y)
- => {"banana", "cherry", "google", "microsoft"}

