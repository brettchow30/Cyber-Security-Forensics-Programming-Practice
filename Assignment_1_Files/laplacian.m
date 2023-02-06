function laplacian(tif,alpha)
    image = imread(tif); %Reads in image input
    g = [0, -0.25, 0; -0.25, 1, -0.25; 0, -0.25, 0]; %laplacian filter represented as g(x,y)
    g = g*alpha; %alpha times filter based on equation
    gx = conv2(image, g, 'same'); %convolution of filter over original image to create laplacian mask
    fx = image + uint8(gx); %adding original image with the sharpened image
    figure
    imshow(uint8(fx)) %show image
%     figure
%     imshow(image)
end