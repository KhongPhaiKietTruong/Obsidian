waitKey(time)

time: mili s

có tác dụng tạm dừng chương trình và chờ người dùng nhập vào phím gì đó
ngoài ra, nó còn trả về mã ascii của phím người dùng nhập, nếu hết thời gian chờ mà người dùng không bấm gì thì trả về -1

lưu ý: nếu để time = 0, đây là một quy ước đặt  biệt, chương trình sẽ dừng lại tại đó mãi mãi cho tới khi người dùng nhập gì đó