với mỗi layer, ta sẽ thực hiện bỏ đi $(1-\text{keep\_prob})*100\%$ đi số neural mỗi lớp, nghĩa là xét mỗi neural, có $(\text{keep\_prob})*100\%$  ta sẽ giữ neural đó lại và $(1-\text{keep\_prob})*100\%$ ta sẽ bỏ neural đó đi
giả sử ta đang xét ở layer l 
đầu tiên ta tính ma trận mask:
```python
d = np.random.rand(*a[l-1])
```