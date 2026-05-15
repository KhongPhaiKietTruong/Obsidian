dịch: ước lượng xác suất hậu nghiệm cực đại

đây là phiên bản nâng cấp của [[MLE (Maximum Likelihood Estimation)]]
ở MLE, khi ta tung đồng xu 10 lần ra 8 mặt trước, 2 mặt sau, ta liền kết luận là xác suất mặt trước là 0.8 và xác suất mặt sau là 0.2
ở MAP thì lại khác, ở đời sống thực tế, ta luôn có niềm tin rằng xác suất 2 mặt đồng xu là bằng nhau, nghĩa là xác suất mặc trước bằng xác suất mặt sau bằng 0.5, ta đem niềm tin đó vào cộng với bằng chứng thực tế là ta vừa tung 10 đồng ra được 8 mặt trước và 2 mặt sau, từ con số 0.5, ta dần chuyển niềm tin thành mặt trước là 0.6 vì ta thấy thực tế ra được tới 8 mặt trước lận, con số 0.6 chính là [[Posterior]] sự dung hòa của [[Prior | định kiến]] có sẵn của chúng ta rằng mặt trước là 0.5 với kết quả thực tế
$$\text{Prior (Định kiến: 0.5)} + \text{Likelihood (Bằng chứng: 0.8)} \xrightarrow{\text{Dung hòa}} \text{Posterior (Kết quả: 0.6)}$$

khi ta tung đồng xu n lần với n rất lớn, tiến đến vô hạn thì **MAP $\approx$ MLE** (Bằng chứng thực tế mạnh đến mức triệt tiêu hoàn toàn niềm tin cũ).