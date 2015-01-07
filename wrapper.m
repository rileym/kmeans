%% Wrapper script
%  Run a series of k-clusterings, take best clustering found

%Read in image data into 3d matrix A, A_large
[A, A_large] = ImageSetUp()

A_image = A_large

k = 16;
maxIter = 40;
tol = .5;

[J, M] = VecQuant(A_image, k, maxIter, tol) %Find locally optimal centroids. 
                                        % A value J and a matrix M are computed. 
                                        %J is the value of the "distortion function" and M 
                                        % centroid locations information.
Jmin = J;
Mmin = M;
N = 10

for i = 1:N %Find a series of localy optimal centroids. 
            % (A local optimum is found for each "VecQuant" call under a different random seed, 
            % so here I'm just finding a "good" local optimum)
    [J, M] = VecQuant(A_image, k, maxIter, tol)

    if(J<Jmin)
        Jmin = J;
        Mmin = M; %Capture the best centroid set found
    end
end
A_new = Replace(A_image, Mmin) %Build new image (with M). Again, would normally make this a function but ran out of time.

%Flip back and forth between full and compressed image.
for i=1:8
    imshow(uint8(round(A_image)));
    pause(1);
    imshow(uint8(round(A_new)));
    pause(1);
end