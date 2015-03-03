# kmeans

This is a well known exercise from the Stanford ML course (in the CS dept). We had to write our own little k-means clustering algorithm to compress an image. 

I took care to leverage Matlab'€™s fast matrix computations by "vectorizing" the code as much as possible,€” i.e., fewer for loops and more linear algebra representation. As a result, it ran much faster than most.

The demo ("€œwrapper.m" is the driver) will run in octave as well as Matlab.

####Basic Idea Behind the Exercise

* Each pixel in the original image is represented as a point in the `RxGxB` color space. 
* The idea of the compression algorithm is to, rather than mapping each pixel to a (potentially) *unique* point in the color space, map each pixel to one of 16 (or however many, depending on the level of compression desired) representative points in the color space that best capture the spectrum of colors in the original image â€” or, put another way, that best minimize the loss of fidelity. 
* The k-means clustering€™ centroids serve as good representative colors.

