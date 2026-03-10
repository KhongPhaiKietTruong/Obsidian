là phiên bản nâng cấp hơn của [[identity()]]
tạo ma trận với giá trị 1 nằm trên đường chéo chính, còn lại là 0
np.eye(n, m, k)
- n: số hàng
- m: số cột, mặc định = n để tạo ma trận vuông
- k: vị trí đường chéo: k=0 (đường chéo chính), k>0 dịch lên, k<0 dịch xuống

```python
# Tạo ma trận đơn vị 3x3 
identity_matrix = np.eye(3) 
print(identity_matrix) 
# Kết quả: 
# [[1. 0. 0.] 
#  [0. 1. 0.] 
#  [0. 0. 1.]]
```