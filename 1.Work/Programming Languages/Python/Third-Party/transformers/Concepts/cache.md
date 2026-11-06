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
