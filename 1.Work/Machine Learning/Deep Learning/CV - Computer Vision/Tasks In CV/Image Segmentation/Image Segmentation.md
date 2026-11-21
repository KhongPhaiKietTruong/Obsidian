## Định Nghĩa 
Image Segmentation là một dạng bài toán trong CV khi ta phải thực hiện gán nhãn đối với từng pixel trong ảnh tương ứng với các class 
## Các Loại Segmentation 
có 3 loại segmentation chính:
- [[Semantic Segmentation]]
- [[Instance Segmentation]]
- [[Panoptic Segmentation]]
## Các Model Cho Dạng Segmentation
### Semantic Segmentation 
- [[U-Net]] 
- [[DeepLabV3+]]
- [[FCN - Fully Convolutional Network]] 
- [[SegFormer]] 
- UPerNet 
- MaskFormer
- Mask2Former 
### Instance Segmentation 
- Mask R-CNN 
## Loss Function 
các loss function thường dùng:
- [[Cross-Entropy Loss]] 
- [[Dice Loss]] 
- [[Focal Loss]] 
trong đó, [[Combined Loss Function]] CE+Dice thường là lựa chọn bắt đầu phổ biến 

## Metric
Metric phổ biến dùng để đánh giá tác vụ segmentation:
- [[Dice Coefficient]]
- [[IoU - Intersection over Union]] 
- [[mIoU]] (segmentation với nhiều lớp)
## Số Lượng Sample 
cho thực hiện tác vụ này tốt, số lượng sample cần khoảng 500-2000 (trong thường hợp có pretrained [[Backbone]])

## EDA Segmentation 
Các thao tác EDA có thể thực hiện cho dạng bài segmentation:
- đếm số lượng mẫu mỗi class 