%% PART (c), Script: Replace
% Build "compressed" image using found optimal centroids

function [A_new] = Replace(A, M)

    dim = length(A);
    mInd = ones(dim);   %mInd is a 512x512 matrix where mInd(k,l) is the index of the
                        %centroid with the minimum distance to pixel k,l for
                        %far seen in the loop. It is initalized to 1, the result 
                        %of the first iteration.
    mD   = (A(:,:,1)-M(1,1)).^2 + (A(:,:,2)-M(1,2)).^2 + (A(:,:,3)-M(1,3)).^2;
                        %mD is a 512x512 matrix where mD(k,l) is the minimum
                        %distance to the centroids (will be centroid mInd(k,l))
                        %so far seen in the iteration
                        
                        %M, mu matrix, was found in previous part

    D_j = zeros(dim);   %D_j is a 512x512 matrix where D_j(k,l) is the
                            %square (color) distance from centroid j to 
                            % pixel k,l.


    %%Find the minimizing centroid for each pixel                
    %For each centroid j = 2,3,...,16
    for j = 2:16

        D_j = (A(:,:,1)-M(j,1)).^2 + (A(:,:,2)-M(j,2)).^2 + (A(:,:,3)-M(j,3)).^2;
        B = D_j < mD;
        mD = (mD - mD.*B) + D_j.*B;
        mInd = (mInd - mInd.*B) + j*B;

    end

    %%Build New Image
    A_new = zeros(dim,dim,3);
    for j = 1:16
        B = mInd==j;    %B(m,l) = 1 if the nearest centroid to pixel m,l
                        %is the jth centroid, 0 otherwise
        A_new(:,:,1) = A_new(:,:,1) + M(j,1)*B;
        A_new(:,:,2) = A_new(:,:,2) + M(j,2)*B;
        A_new(:,:,3) = A_new(:,:,3) + M(j,3)*B;
    end

end




