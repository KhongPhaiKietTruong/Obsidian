là một cách để biểu diễn các từ thành [[Vector]] số 
thay vì biểu diễn các từ bằng [[One-hot encoding]] khiến các vector số của từ không có mối quan hệ gì với nhau, ta sẽ sử dụng word embeddings, ta có n feature như giới tính, giá tiền, là là thức ăn?, là động vật?, ... (thực tế thì mô hình sẽ tự học ra các [[Features]] này) rồi dùng từ đó đặt ra các giá trị cho từng feature này (nếu từ là "cat" thì giá trị feature "là động vật" sẽ có giá trị cao gần bằng 1), các từ có ngữ nghĩ khá giống nhau thì các vector số của nó cũng sẽ gần nhau 

ta thường pretrain trên một lượng liệu rất lớn để học được các word embeddings, rồi dùng các word ebeddings đó để tiếp tục thực hiện [[Transfer Learning]] 
![[Pasted image 20260919123637.png]]
![[Pasted image 20260919133310.png]]