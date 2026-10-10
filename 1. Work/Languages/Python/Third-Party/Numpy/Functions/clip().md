```python
np.clip(a, a_min, a_max)
```
dùng để gán cận trên và cận dưới cho phần tử, nếu phần tử < a_min thì nhận a_min
nếu > a_max thì nhận a_ax

![[Pasted image 20260119091706.png]]
```python
a = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9])
a = np.clip(a, 3, 6)
print(a)

#output:
#[3 3 3 4 5 6 6 6 6]
```