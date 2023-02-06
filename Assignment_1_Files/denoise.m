function denoise(tif1,tif2)
    peppers1 = imread(tif1);
    peppers2 = imread(tif2);

    % show original pepper images
%     imshow(peppers1)
%     figure
%     imshow(peppers2)

    % use a 3x3 averaging filter to densoise the images
    avgMask3= ones(3)/9;
    peppers1Avg3= filter2(avgMask3,peppers1);
    figure
    imshow(uint8(peppers1Avg3))
    peppers2Avg3= filter2(avgMask3,peppers2);
    figure
    imshow(uint8(peppers2Avg3))
    
    % use a 3x3 median filter to denoise the images
    peppers1Med3= medfilt2(peppers1,[3 3]);
    figure
    imshow(peppers1Med3)
    peppers2Med3= medfilt2(peppers2,[3 3]);
    figure
    imshow(peppers2Med3)
    
%     % use a 5x5 averaging filter to densoise the images
%     avgMask5= ones(5)/25; 
%     peppers1Avg5= filter2(avgMask5,peppers1); 
%     figure
%     imshow(uint8(peppers1Avg5))
%     peppers2Avg5= filter2(avgMask5,peppers2); 
%     figure
%     imshow(uint8(peppers2Avg5))
%     
%     % use a 5x5 median filter to denoise the images
%     peppers1Med5= medfilt2(peppers1,[5 5]);
%     figure
%     imshow(peppers1Med5)
%     peppers2Med5= medfilt2(peppers2,[5 5]);
%     figure
%     imshow(peppers2Med5)
    
    % Sobel filter for row direction
    SobelX= [
    1 0 -1
    2 0 -2
    1 0 -1 ];

    % Sobel filter for column directon
    SobelY= SobelX.';
    
    % calculate the gradient in each cardinal direction
    Gx1= filter2(SobelX,peppers1Avg3); % x-direction
    Gy1= filter2(SobelY,peppers1Avg3); % y-direction
    
    Gx2= filter2(SobelX,peppers1Med3); % x-direction
    Gy2= filter2(SobelY,peppers1Med3); % y-direction

    % calculate the magnitude of the gradient
    gradMag1= (Gx1.^2 + Gy1.^2).^.5;
    gradMag2= (Gx2.^2 + Gy2.^2).^.5;
    % show the magnitude of the image's gradient
    figure
    imshow(uint8(gradMag1))
    figure
    imshow(uint8(gradMag2))
    
    threshold= 128;
    edgemap1= gradMag1 > threshold; %get pixels only above 128 in gradMag1

    figure
    imshow(edgemap1) %display edgemap for averaging filter
    
    edgemap2= gradMag2 > threshold; %get pixels only above 128 in gradMag2

    figure
    imshow(edgemap2) %display edgemap for median filter
    
    
    
end