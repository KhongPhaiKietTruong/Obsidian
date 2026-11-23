dùng để đọc các frame của một video, trả về ret (viết tắt của return, trả về bool để cho biết đọc frame thành công hay không) và frame (một ma trận numpy thể hiện frame)

ví dụ:
```python
def read_video(video_path):
    cap = cv2.VideoCapture(video_path)
    frames = []
    while True:
        ret, frame = cap.read()

        if not ret:
            break
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        frames.append(frame)
    cap.release()
    if len(frames) == 0:
        raise ValueError(f"Could not read any frames from {video_path}")
    frames = torch.from_numpy(np.stack(frames, axis=0))
    return frames
```