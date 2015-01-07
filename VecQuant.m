%% PART (b), Script VecQuant
% Find the optimal centroids

%NOTE: I USED THE LARGER IMAGE IN PART B BECAUSE PERFORMANCE WAS
%SUPER FAST WITH THE SMALLER IMAGE AND FINE WITH THE LARGER.

k = 16;
dim = length(A_large);
maxIter = 40;
tol = .5;
rA = [reshape(A_large(:,:,1),[1,dim^2]); reshape(A_large(:,:,2),[1,dim^2]); reshape(A_large(:,:,3),[1,dim^2])];
        %rA is a useful reshaping of A to take advantage of linear
        %algegra notation (and MATLAB efficiency) in the second inner 
        %loop below.

M =  zeros(k,3);    %M, mu, is a 16x3 matrix where M(k,:) is the color 
                    %(horizontal) vector of the kth centroid.
%----Initialize M to random pixels----------------%  
R = randi(dim,k,2);
for i = 1:16
    M(i,:) = squeeze(A_large(R(i,1),R(i,2),:))';
end
%------------------------------------------------%
        
mInd = ones(dim);   %mInd is a 128x128 (512x512) matrix where mInd(k,l) is the index of the
                    %centroid with the MINIMUM DISTANCE to pixel k,l so
                    %far seen in the loop. It is initalized to 1, the result 
                    %of the first iteration.
                    
mD   = (A_large(:,:,1)-M(1,1)).^2 + (A_large(:,:,2)-M(1,2)).^2 + (A_large(:,:,3)-M(1,3)).^2;
                    %mD is a 128x128 (512x512) matrix where mD(k,l) is the
                    %DISTANCE TO THE NEAREST CENTROID [mInd(k,l)] 
                    %so far seen in the loop.
                    
J_prev = sum(sum(mD)); %Record "Distortion Function"
                        
%%Outer Loop
for i=1:maxIter

    D_j = zeros(dim);   %D_j is a 128x128 (512x512) matrix where D_j(k,l) is the
                            %square (color) distance from centroid j to 
                            % pixel k,l.
    

    %%Find the minimizing centroid for each pixel                
    %For each centroid j = 2,2,...,16
    for j = 2:16

        %Calculate sum of square deviations from the jth centroid
        D_j = (A_large(:,:,1)-M(j,1)).^2 + (A_large(:,:,2)-M(j,2)).^2 + (A_large(:,:,3)-M(j,3)).^2;
        %Identify for which pixels this was the smallest distance
        %so far seen.
        B = D_j < mD;
        %Update mD and mInd accordingly
        mD = (mD - mD.*B) + D_j.*B;
        mInd = (mInd - mInd.*B) + j*B;

    end
    
    %Calculate "distortion function" and break if small enough change since
    %the last iteration
    J = sum(sum(mD));
    delta_J = J-J_prev;
    if(abs(delta_J) < tol)
        break
    end
    J_prev = J;
    
    %%Compute new centroids
    
    %Recalculate each centroid as average of color vecors nearest it. 
    for j = 1:16
        %c_j is the vecor with a 1 in row i if the ith colum (color
        %vectors) in rA corresponds a pixel which is nearest to centroid j,
        %0 otherwise
        c_j = reshape((mInd==j*ones(dim)),[dim^2,1]);
        %rA*c_j is the sum of those in color vectors
        mu_j = rA*c_j/(sum(c_j));
        M(j,:) = mu_j';
    end    

end








