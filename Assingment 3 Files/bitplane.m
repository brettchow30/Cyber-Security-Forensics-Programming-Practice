function bitplane(tif, bits)
    c = imread(tif);
    figure
    imshow(c);
    cd = double(c);
%     figure
%     imshow(cd);
    c0 = mod(cd,2);
    c01 = mod(c,2);
    figure, imshow(c0);
    
    cout = mod(floor(cd/bits), 2);
    figure, imshow(cout)
end