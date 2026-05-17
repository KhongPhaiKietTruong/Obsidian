đây là một lỗi khi repo bị xung đột commit
giả sử repo đang có commit như sau: A -> B
trên máy ta đang có repo ở commit A, ta commit C và muốn muốn push nó lên
thì sẽ gây ra lỗi do repo đã có sẵn commit B rồi và git không muốn ghi đè C lên B

giải pháp: pull commit B về rồi mới commit