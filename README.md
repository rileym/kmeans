# kmeans

This is a well know exerices from the stanford ML course. We had to write our own little k-means clustering algorithm to compress an image. 

Each pixel is a point RxGxB color space. The idea is to, instead of mapping each pixel to a unique point in the color space, map each pixel to one of 16 (or however many, depending on the level of compression desired) points in the color space that best represent the spectrum of colors in the original image. We can gauge the "similarity" of any two colors (points in the color space) by their eudlidian distance in the color space.

I wouldn't say this problem is that difficult, but I took care to leverage Matlab fast matrix computations by "vectorizing" the code as much as possible -- i.e. few for loops and lots of linear algebra. As a result it ran much faster than most.
