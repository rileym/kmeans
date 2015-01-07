%imread the two images into A and A_large

function [A, A_large] = ImageSetUp()

    A = double(imread('md-small.tiff'));
    A_large = double(imread('md-large.tiff'));

end

