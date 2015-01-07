%% Wrapper script
%  Run a series of k-clusterings, take best clustering found

%Read in image data into 3d matrix A, A_large
ImageSetUp
VecQuant %Find locally optimal centroids. Would normally make this a function, rather than a script, but ran out of time.
        % A value J and a matrix M are computed. J is the value of the "distortion function" and M centroid information.
Jmin = J;
Mmin = M;
for i = 1:20 %Find a series of localy optimal centroid. 
            % (A local optimum is found for each "VecQuant" under a random seed, 
                % so here I'm just finding a "good" local optimum)
    VecQuant
    if(J<Jmin)
        Jmin = J;
        Mmin = M; %Capture the best centroid set found
    end
end
Replace %Build new image (with M). Again, would normally make this a function but ran out of time.

%Display new image 
for i=1:8
    imshow(uint8(round(A_large)));
    pause(1);
    imshow(uint8(round(A_new)));
    pause(1);
end