# OpenCV MOC (Map of Content)

## 1. Thuộc tính của Ảnh (Image Attributes)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Attribute/shape|shape]] - Kích thước, hình dạng của ảnh (đối với ảnh màu: chiều cao, chiều rộng, số kênh màu; đối với ảnh xám: chiều cao, chiều rộng)

## 2. Đọc, Ghi & Hiển thị ảnh (IO Operations)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/imread()|imread()]] - Đọc ảnh từ file đường dẫn (mặc định dạng BGR) và trả về ma trận NumPy
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/imshow()|imshow()]] - Hiển thị ảnh ra cửa sổ riêng biệt
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/imwrite()|imwrite()]] - Lưu ma trận ảnh thành file ảnh tại đường dẫn chỉ định
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/waitKey()|waitKey()]] - Tạm dừng chương trình và chờ người dùng nhập phím (đơn vị miligiây)

## 3. Biến đổi Hình học (Geometric Transformations)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/resize()|resize()]] - Thay đổi kích thước ảnh (bằng dsize hoặc hệ số tỉ lệ fx, fy)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/flip()|flip()]] - Lật ảnh theo chiều dọc, chiều ngang hoặc cả hai
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/getRotationMatrix2D()|getRotationMatrix2D()]] - Tính toán ma trận biến đổi 2D dùng để xoay ảnh
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/warpAffine()|warpAffine()]] - Áp dụng phép biến đổi Affine để dịch chuyển hoặc xoay ảnh từ ma trận biến đổi

## 4. Xử lý Không gian màu & Kênh màu (Color Space & Channels)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/cvtColor()|cvtColor()]] - Chuyển đổi không gian màu của ảnh (ví dụ BGR sang Grayscale, HSV, v.v.)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/split()|split()]] - Tách ảnh màu (BGR) thành các kênh màu đơn lẻ (Blue, Green, Red)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/merge()|merge()]] - Gộp các kênh màu đơn lẻ thành một ảnh màu hoàn chỉnh

## 5. Làm mờ & Làm mịn (Blurring & Smoothing)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/blur()|blur()]] - Làm mờ ảnh bằng phương pháp lọc trung bình (Average Blur)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/GaussianBlur()|GaussianBlur()]] - Làm mờ ảnh bằng bộ lọc Gauss (giúp giảm nhiễu tốt)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/medianBlur()|medianBlur()]] - Làm mờ ảnh bằng bộ lọc trung vị (thích hợp khử nhiễu muối tiêu, kernel size là số nguyên lẻ)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/bilateralBlur()|bilateralBlur()]] - Làm mờ/mịn ảnh nhưng vẫn giữ lại các đường biên cạnh sắc nét (bộ lọc song phương)

## 6. Vẽ hình & Viết chữ (Drawing & Text Operations)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/line()|line()]] - Vẽ một đường thẳng nối giữa hai điểm trên ảnh
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/circle()|circle()]] - Vẽ một hình tròn với tâm và bán kính chỉ định
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/rectangle()|rectangle()]] - Vẽ một hình chữ nhật xác định bởi hai đỉnh đối diện
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/putText()|putText()]] - Chèn chữ (văn bản) lên ảnh với font chữ và vị trí chỉ định

## 7. Tiền xử lý & Phép toán hình thái (Preprocessing & Morphological Operations)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/threshold()|threshold()]] - Phân ngưỡng ảnh, chuyển ảnh xám thành ảnh nhị phân (đen/trắng)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/erode()|erode()]] - Phép co ảnh (làm mỏng nét vẽ, loại bỏ nhiễu trắng nhỏ)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/dilate()|dilate()]] - Phép giãn ảnh (làm dày nét vẽ, lấp đầy các lỗ trống)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/absdiff()|absdiff()]] - Tính hiệu số tuyệt đối giữa hai ảnh (thường dùng để phát hiện sự khác biệt/chuyển động)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/mask()|mask()]] - Tách ảnh, chỉ giữ lại vùng quan tâm (ROI) và che các vùng còn lại

## 8. Đường viền & Cạnh (Contours & Edges)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/Canny()|Canny()]] - Thuật toán phát hiện cạnh/đường biên Canny
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/findContours()|findContours()]] - Tìm kiếm các đường bao (contours) khép kín của vật thể trong ảnh nhị phân
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/drawContours()|drawContours()]] - Vẽ các đường bao (contours) đã tìm được lên ảnh

## 9. Các hàm bổ trợ khác (Other Utility Functions)
- [[Content/Work/Languages/Python/Third-Party/OpenCV/Method/apply_along_axis()|apply_along_axis()]] - Hàm NumPy áp dụng một hàm xử lý dọc theo một trục được chỉ định
