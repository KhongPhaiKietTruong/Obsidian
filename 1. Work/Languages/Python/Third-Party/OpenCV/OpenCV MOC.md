# OpenCV MOC (Map of Content)

## 1. Thuộc tính của Ảnh (Image Attributes)
- [[1. Work/Languages/Python/Third-Party/OpenCV/Attribute/shape|shape]] - Kích thước, hình dạng của ảnh (đối với ảnh màu: chiều cao, chiều rộng, số kênh màu; đối với ảnh xám: chiều cao, chiều rộng)

## 2. Đọc, Ghi & Hiển thị ảnh (IO Operations)
- [[imread()|imread()]] - Đọc ảnh từ file đường dẫn (mặc định dạng BGR) và trả về ma trận NumPy
- [[imshow()|imshow()]] - Hiển thị ảnh ra cửa sổ riêng biệt
- [[imwrite()|imwrite()]] - Lưu ma trận ảnh thành file ảnh tại đường dẫn chỉ định
- [[waitKey()|waitKey()]] - Tạm dừng chương trình và chờ người dùng nhập phím (đơn vị miligiây)

## 3. Biến đổi Hình học (Geometric Transformations)
- [[resize()|resize()]] - Thay đổi kích thước ảnh (bằng dsize hoặc hệ số tỉ lệ fx, fy)
- [[flip()|flip()]] - Lật ảnh theo chiều dọc, chiều ngang hoặc cả hai
- [[getRotationMatrix2D()|getRotationMatrix2D()]] - Tính toán ma trận biến đổi 2D dùng để xoay ảnh
- [[warpAffine()|warpAffine()]] - Áp dụng phép biến đổi Affine để dịch chuyển hoặc xoay ảnh từ ma trận biến đổi

## 4. Xử lý Không gian màu & Kênh màu (Color Space & Channels)
- [[cvtColor()|cvtColor()]] - Chuyển đổi không gian màu của ảnh (ví dụ BGR sang Grayscale, HSV, v.v.)
- [[split()|split()]] - Tách ảnh màu (BGR) thành các kênh màu đơn lẻ (Blue, Green, Red)
- [[merge()|merge()]] - Gộp các kênh màu đơn lẻ thành một ảnh màu hoàn chỉnh

## 5. Làm mờ & Làm mịn (Blurring & Smoothing)
- [[blur()|blur()]] - Làm mờ ảnh bằng phương pháp lọc trung bình (Average Blur)
- [[GaussianBlur()|GaussianBlur()]] - Làm mờ ảnh bằng bộ lọc Gauss (giúp giảm nhiễu tốt)
- [[medianBlur()|medianBlur()]] - Làm mờ ảnh bằng bộ lọc trung vị (thích hợp khử nhiễu muối tiêu, kernel size là số nguyên lẻ)
- [[bilateralBlur()|bilateralBlur()]] - Làm mờ/mịn ảnh nhưng vẫn giữ lại các đường biên cạnh sắc nét (bộ lọc song phương)

## 6. Vẽ hình & Viết chữ (Drawing & Text Operations)
- [[line()|line()]] - Vẽ một đường thẳng nối giữa hai điểm trên ảnh
- [[circle()|circle()]] - Vẽ một hình tròn với tâm và bán kính chỉ định
- [[rectangle()|rectangle()]] - Vẽ một hình chữ nhật xác định bởi hai đỉnh đối diện
- [[putText()|putText()]] - Chèn chữ (văn bản) lên ảnh với font chữ và vị trí chỉ định

## 7. Tiền xử lý & Phép toán hình thái (Preprocessing & Morphological Operations)
- [[threshold()|threshold()]] - Phân ngưỡng ảnh, chuyển ảnh xám thành ảnh nhị phân (đen/trắng)
- [[erode()|erode()]] - Phép co ảnh (làm mỏng nét vẽ, loại bỏ nhiễu trắng nhỏ)
- [[dilate()|dilate()]] - Phép giãn ảnh (làm dày nét vẽ, lấp đầy các lỗ trống)
- [[absdiff()|absdiff()]] - Tính hiệu số tuyệt đối giữa hai ảnh (thường dùng để phát hiện sự khác biệt/chuyển động)
- [[mask()|mask()]] - Tách ảnh, chỉ giữ lại vùng quan tâm (ROI) và che các vùng còn lại

## 8. Đường viền & Cạnh (Contours & Edges)
- [[Canny()|Canny()]] - Thuật toán phát hiện cạnh/đường biên Canny
- [[findContours()|findContours()]] - Tìm kiếm các đường bao (contours) khép kín của vật thể trong ảnh nhị phân
- [[drawContours()|drawContours()]] - Vẽ các đường bao (contours) đã tìm được lên ảnh

## 9. Các hàm bổ trợ khác (Other Utility Functions)
- [[apply_along_axis()|apply_along_axis()]] - Hàm NumPy áp dụng một hàm xử lý dọc theo một trục được chỉ định
