LR: learning rate
***
## Định Nghĩa 
Discriminitive LR là kĩ thuật áp dụng LR khác nhau cho các layer/stage trong cùng một mô hình 
thường thì model được chia làm hai phần là pretrained [[Backbone]] và [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]], ta thường để [[Base Learning Rate]] của backbone thấp hơn so với head vì backbone đã có pretrained [[Weight]] rồi nên chỉ cần điều chỉnh nhẹ
## Ứng Dụng
Kĩ thuật này thường được sử dụng khi thực hiện [[Fine-Tuning]] một model vì nó giúp hạn chế tình trạng [[Catastrophic Forgetting]] 

## Code 