% Read the depth map file
M =  csvread('~/Downloads/_Depth_6717.csv');

% size of the depth image (y, x)
size(Depth)
% size of the depth map  (y, x)
size(M)

% Approach 1
% Extract centroid
box5.Centroid
box5.Centroid(1)
box5.Centroid(2)
cent = round(box5.Centroid);

% Distance between the camera and the animal 
M(cent(2), cent(1))

% Distance between the camera and the floor was 2.25 m
M(155,300)

% Height of the animal 
2.25 - M(cent(2), cent(1))


% Approach 2
box5 = regionprops(BW5, 'FilledArea', 'Area', 'BoundingBox','MajorAxisLength','MinorAxisLength', 'Centroid', 'Orientation', 
'Extent', 'Eccentricity', 'PixelList');

box5.PixelList
box5.PixelList(:,1)
box5.PixelList(:,2)
M(box5.PixelList(:,2), box5.PixelList(:,1))
mean2(M(box5.PixelList(:,2), box5.PixelList(:,1)))

% Height of the animal 
2.25 - Mmean2(M(box5.PixelList(:,2), box5.PixelList(:,1)))


% Approach 3
% Extract the average pixel intensity of the segmented pig 
Depth2 = Depth;
Depth2(repmat(~BW5,[1 1 3])) = 0;
imshow(Depth2)
mean(Depth2(repmat(BW5,[1 1 3])))




