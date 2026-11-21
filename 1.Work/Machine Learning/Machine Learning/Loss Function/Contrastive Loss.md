## Định Nghĩa 
Contrastive Loss có công thức: 
$$
L = yD^2+(1-y)\max(0,m-D)^2
$$
Trong đó:
- $D$: khoảng cách giữa hai embedding.
- $y=1$: Positive Pair.
- $y=0$: Negative Pair.
- $m$: Margin, khoảng cách tối thiểu mong muốn giữa Negative Pairs.

ta mong muốn D của positive pair tiến về 0 và D của negative pair thì phải >= m

## Sử Dụng 
- được sử dụng trong [[Contrastive Learning]] 