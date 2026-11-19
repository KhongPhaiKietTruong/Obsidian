## Định Nghĩa 
Learning Rate Decay là một kĩ thuật giúp [[Gradient Descent]] hội tụ chính xác hơn bằng cách giảm dần [[Effective Learning Rate]]

khi bắt đầu huấn luyện, ta cần LR lớn để có thể nhanh chóng tiến về [[Global Minimum]], tuy nhiên, khi càng gần cực tiểu toàn cục rồi thì ta sẽ muốn learning rate nhỏ hơn để tránh hiện tượng ta bị nhảy qua nhảy lại (dao động) xung quanh cực tiểu toàn cục 

công thức:
$$
a_{t} = \frac{a_{0}}{1+kt}
$$
với:
- k là decay rate 
- t là số epoch hiện tại 
