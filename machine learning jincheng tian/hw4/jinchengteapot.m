load('teapots.mat');





average = mean(teapotImages);
X = teapotImages - average;
C = cov(X);


[eigenvector,eigenvalue] =eig(C);
[d, ind] = sort(diag(eigenvalue),'descend');
d = d(1:3,:);
v = eigenvector(:,ind(1:3));
c = X*v;
X_hat = average +c*v';

sorted = sort(max(eigenvalue),'descend');
[~,max_each_colum]=find(eigenvalue>sorted(4));



for i = 1:10
    figure(i);
    
    subplot(1,2,1);
    imagesc(reshape(teapotImages(i,:),38,50));
    colormap gray;
    title('before reconstruct');
    axis image;
    subplot(1,2,2)
    imagesc(reshape(X_hat(i,:),38,50));
    title('after PCA reconstruct');
    axis image;
end






% this is the mean and to plot the graph 
figure(11);

imagesc(reshape(average,38,50));
colormap gray;


% this is the 3 top eigenvectors
h=figure(12);
for i=1:3
    subplot(2,3,i);
    imagesc(reshape(eigenvector(:,max_each_colum(i)),38,50));
    colormap gray;
    hold;
end