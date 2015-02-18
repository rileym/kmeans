# kmeans

This is a well know exercise from the Stanford ML course (in the CS dept). We had to write our own little k-means clustering algorithm to compress an image. 

Each pixel corresponds to a point RxGxB color space. The idea of the compression algorithm is to, instead of mapping each pixel to a (potentially) unique point in the color space, map each pixel to one of 16 (or however many, depending on the level of compression desired) representative points in the color space that best capture the spectrum of colors in the original image — or, put another way, that best minimize the loss of fidelity. The k-means’ centroids serve as good representative colors.

I wouldn't say this problem is that difficult, but I took care to leverage Matlab’s fast matrix computations by "vectorizing" the code as much as possible — i.e. few for loops and more linear algebra. As a result it ran much faster than most.

This runs in octave as well, no special Matlab modules or functions within.