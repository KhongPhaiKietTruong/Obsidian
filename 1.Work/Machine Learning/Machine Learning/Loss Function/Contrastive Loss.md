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

