các cache của thư viện [[transformers]] được mặc định lưu trong "/home/user/.cache/huggingface/hub/", đường dẫn này sẽ chứa các folder đại diện cho các repo mà ta đã tải từ huggingface.co 
mỗi repo sẽ có cấu trúc như sau:
```
models--<org>--<repo_name>/
├── snapshots/
│   └── <commit_hash>/
│       ├── config.json
│       ├── preprocessor_config.json
│       └── model.safetensors (hoặc pytorch_model.bin)  <-- File trọng số thực sự nằm ở đây
├── refs/
└── blobs/
```
với:
- blobs/ : là folder chứa file nhị phân của tất cả file trong folder repo với tên đã được hash 
- snapshots/ :chứa các folder đại diện cho mỗi lần commit (như trên github) với tên được hash, bên trong mỗi folder commit là các file hoàn chỉnh, tuy nhiên các file này thực chất cũng chỉ là symlink trỏ đến các file bên trong folder blobs ở trên  
- refs/ : lưu trữ các thông tin để tham chiếu đến commit (folder snapshots) mới nhất 