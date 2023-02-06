function show_pixel_hist(tif)
    pout = imread(tif); %Reads in image input
    [hval,pixval]= imhist(pout);

    figure
    bar(pixval,hval)
end