
% Install the image package
pkg install -forge image
pkg load image


% Read the pig image
RGB = imread("~/Downloads/_Color_130.png");
% Display the image
imshow(RGB)

% Pig pixel values
impixel(RGB, 340, 320) 
% Ground pixel values
impixel(RGB, 500, 180)

% Convert the RGB image to gray image
I = rgb2gray(RGB);
imshow(I)

% Use im2bw because imbinarize is not implemented yet in Octave
% Convert image to binary image
BW1 = im2bw(I);
imshow(BW1); 
% filter based on area
BW2 = bwpropfilt(BW1,'Area',1); 
imshow(BW2);
montage(cat(1, BW1, BW2));




% Alternative approach 1 
% Remove stuructures connected to the image border
BW3 = imclearborder(BW1);
imshow(BW3);
montage(cat(1, BW1, BW3));
% Extract the largest object from binary image
BW4 = bwpropfilt(BW3,'Area',1);
imshow(BW4);
montage(cat(1, BW3, BW4));
# Read the regionprops help page
help regionprops
% Extract image features
box4 = regionprops(BW4, 'FilledArea', 'Area', 'BoundingBox','MajorAxisLength','MinorAxisLength', 'Centroid', 'Orientation', 'Extent', 'Eccentricity')
% Draw a bounding box
imshow(BW4);
rectangle('Position', box4.BoundingBox, 'EdgeColor','r', 'LineWidth',5)





% Alternative approach 2
montage(cat(1, BW1, BW3)); % what might be a potential issue?
imshow(I) 
[y, x] = size(I)
I2 = imcrop(I, [150, 0, x, y]);
imshow(I2)
BW5 = im2bw(I2);
imshow(BW5); 
BW6 = imclearborder(BW5);
imshow(BW6)
montage(cat(1, BW5, BW6));
% Extract the largest object from binary image
BW7 = bwpropfilt(BW6,'Area',1);
imshow(BW7)
# read the regionprops help page
help regionprops
% Extract image features
box7 = regionprops(BW7, 'FilledArea', 'Area', 'BoundingBox','MajorAxisLength','MinorAxisLength', 'Centroid', 'Orientation', 'Extent', 'Eccentricity')
% Draw a bounding box
imshow(BW7);
rectangle('Position', box7.BoundingBox, 'EdgeColor','r', 'LineWidth',5)




