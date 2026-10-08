là kết hợp của [[Linear Regression]], [[L1 Regularization]] và [[L2 Regularization]] 
$$\mathcal{L}_{\text{ElasticNet}}(w) = \frac{1}{2N} \sum_{i=1}^{N} (y_i - x_i^T w)^2 + \lambda \left[ \alpha \Vert{}w\Vert{}_1 + \frac{1 - \alpha}{2} \Vert{}w\Vert{}_2^2 \right]$$
