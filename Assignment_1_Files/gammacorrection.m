function gammacorrection(tif,gamma)
    pout = imread(tif); %Reads in image input 
    v = 255*(double(pout)/255).^(gamma); %Performs gamma correction with gamma input
    figure
    imshow(uint8(v)) %Shows image with gamma correction
    
    figure
    imhist(uint8(v)) %Displays Pixel Value Histogram of gamma corrected input image
    
    poutHisEq= histeq(pout); 
    figure
    imshow(poutHisEq) %Shows Histogram Equalization Image of input
end







