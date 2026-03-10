import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms

# 1. Thiết lập Thiết bị (Sử dụng GPU nếu có)
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# 2. Chuẩn bị dữ liệu (Data Loading)
transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,))])

train_dataset = torchvision.datasets.MNIST(root='./data', train=True, transform=transform, download=True)
train_loader = torch.utils.data.DataLoader(dataset=train_dataset, batch_size=64, shuffle=True)

# 3. Định nghĩa Kiến trúc mạng Neural (Model)
class SimpleNet(nn.Module):
    def __init__(self):
        super(SimpleNet, self).__init__()
        self.flatten = nn.Flatten()
        self.fc_layers = nn.Sequential(
            nn.Linear(28*28, 128),
            nn.ReLU(),
            nn.Linear(128, 10)  # 10 lớp đầu ra tương ứng từ 0-9
        )

    def forward(self, x):
        x = self.flatten(x)
        return self.fc_layers(x)

model = SimpleNet().to(device)

# 4. Định nghĩa Loss Function và Optimizer
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# 5. Vòng lặp Huấn luyện (Training Loop)
print("Bắt đầu huấn luyện...")
for epoch in range(2):  # Chạy 2 vòng lặp (epochs)
    for i, (images, labels) in enumerate(train_loader):
        images, labels = images.to(device), labels.to(device)
        
        # Forward pass
        outputs = model(images)
        loss = criterion(outputs, labels)
        
        # Backward pass và tối ưu hóa
        optimizer.zero_grad() # Xóa gradient cũ
        loss.backward()       # Tính toán gradient mới
        optimizer.step()      # Cập nhật trọng số
        
        if (i+1) % 400 == 0:
            print(f'Epoch [{epoch+1}/2], Step [{i+1}/938], Loss: {loss.item():.4f}')

print("Huấn luyện hoàn tất!")
