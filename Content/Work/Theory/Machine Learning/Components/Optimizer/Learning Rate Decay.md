là một kĩ thuật giúp [[Gradient Descent]] hội tụ nhanh hơn

khi bắt đầu huấn luyện, ta cần [[Learning Rate (Tốc Độ Học)]] lớn để có thể nhanh chóng tiến về [[Global Minimum (Cực Tiểu Toàn Cục)]], tuy nhiên, khi càng gần cực tiểu toàn cục rồi thì ta sẽ muốn learning rate nhỏ hơn để tránh hiện tượng [[Gradient]] nhảy vượt quá điểm đó qua lại 

công thức:
$$
a_{t} = \frac{a_{t-1}}{1+kt}
$$
với:
- k là decay rate 
- t là số epoch hiện tại 