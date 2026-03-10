
dịch là: cơ sở riêng

Eigenbasis là một hệ cơ sở (một tập hợp các vector), mà các trục (các vector trong tập hợp) của nó là những vector đặc biệt [[Eigenvector]]. phép biến đổi A không làm các vector rời khỏi phương ban đầu của chúng, mà chỉ kéo dãn hoặc co lại vector đó theo một tỷ lệ nhất định (gọi là [[Eigenvalue]]).

một ma trận chỉ có cơ sở riêng khi nó có số lượng vector riêng bằng với số chiều ma trận và các vector riêng đó độc lập tuyến tính với nhau

một ma trận không có cơ sở riêng là **cực hiếm**, gần như ma trận nào cũng có

ví dụ:
ta có ma trận A = $\begin{bmatrix}2 & 1 \\ 0 & 3\end{bmatrix}$ , ta muốn tìm điểm B = (3, 2) sau khi đã thực hiện phép biến đổi A lên không gian, nghĩa là sau khi thực hiện phép biến đổi A lên không gian, ta muốn biết điểm B nằm ở đâu
thông thường, ta thực hiện phép nhân ma trận để biết được:
$$
\begin{bmatrix}2 & 1 \\ 0 & 3\end{bmatrix} \cdot \begin{bmatrix}
3 \\
2
\end{bmatrix} = \begin{bmatrix}
8 \\
6
\end{bmatrix}
$$
nghĩa là điểm B sau khi thực hiện phép biển đổi A sẽ có tọa độ là (8, 6)

tuy nhiên có một cách để ta tính được mà không cần nhân ma trận, giảm thao tác tính toán xuống, đó là khi ta đã có được eigenbasis

giả sử ta biết được rằng, eigenbasis của ma trận A là $i=\begin{bmatrix}1 \\ 0\end{bmatrix} và \ j=\begin{bmatrix}1 \\ 1\end{bmatrix}$ (i, j và các vector riêng)
điểm B ban đầu có thể được biểu diễn theo eigenbasis của A như sau: B = i + 2j
sau khi thực hiện phép biển đổi A lên, thì B cũng i công thức như vậy, chỉ cần nhân trị riêng của từng vector riêng vào là được (trị riêng của i là 2, của j là 3), nghĩa là: B(sau) = 2i + 6j

khi thực hiện như vậy, ta thấy rằng tốc độ cũng không khác nhau mấy

nhưng với trường hợp tính $A^{100} \cdot v$ (với v = 8i + 9j) chẳng hạn, tính theo cách thường ta cần nhân A với chính nó 99 lần

nhưng với eigen vector, ta chỉ cần mũ trị riêng của nó lên là xong: $8 \cdot 2^{100}i + 9 \cdot 3^{100}j$
lí do mà ma mũ trị riêng lên là được vì:
phép biến đổi A có eigenbasis là i và j (xem ở trên), trị riêng của i là 2, của j là 3, có nghĩa là khi áp phép biến đổi A 1 lần lên không gian, i và j không lệch khỏi phương mà chỉ bị kéo giãn lên trị riêng lần của nó (i bị kéo lên thành 2i, tương tự với j là thành 3j), vậy thì khi áp phép biến đổi A lên không gian 100 lần thì i và j cũng bị giãn ra (trị riêng)^số lần 