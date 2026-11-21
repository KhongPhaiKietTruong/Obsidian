## Định Nghĩa 
[[Contrastive Loss]] thì nhận một mẫu là 2 bức ảnh, [[Triplet Loss]] nhận 3 bức, còn InfoNCE Loss thì nhận vào 2+n bước: 1 anchor + 1 positive + n negative (n do ta chỉ định)
công thức:
$$
\mathcal{L}_{InfoNCE} = -\log \frac{ \exp(sim(z_i,z_i^+)/\tau) }{ \sum_{j=1}^{N} \exp(sim(z_i,z_j)/\tau) }
$$

