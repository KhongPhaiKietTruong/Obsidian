là phương pháp mà tách một từ thành các n-gram kí tự
'where' -> <wh, whe, her, ere, re> (mỗi n-gram là một vector)

vector('where') = vector('<wh') + ... vector('re>)

phương pháp này mạnh trong việc xử lí [[OOV]] (out of [[Vocabulary]]) (các từ không nằm trong vocab)
