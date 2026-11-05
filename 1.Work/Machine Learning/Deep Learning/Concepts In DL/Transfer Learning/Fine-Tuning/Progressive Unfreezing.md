là một phương pháp [[Fine-Tuning]] với cơ chế như sau:
bước 1: đóng băng toàn bộ [[1.Work/OLP AI/Computer Vision Architecture/Backbone|Backbone]] và huấn luyện trên [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head/Head|Head]] một vài [[Epoch]] 
bước 2: mở một vài block/layer cuối của backbone rồi huấn luyện chung với head 
bước 3: ở mỗi epoch tiếp theo, mờ dần dần các block/layer đến khi mở hết 