folderPath = '/Users/theo/Downloads/eeglab2023.1/data';
% mtx = zeros(128, ceil(2287093 / 4));
mtx = zeros(128, 541709);

for i = 1:128
    fprintf("Processing channel %d\n", i);

    data = load(sprintf("ECoG_ch%d.mat", i));
    n = sprintf("ECoGData_ch%d", i);

    chan = cast(data.(n), "double");

    params.Fs = 1000;
    params.fpass = [0, 100];
    params.tapers = [5, 9];
    params.pad = 2;
    
%     chan_filtered = rmlinesc(chan, params);
    chan_filtered = chan;
    chan_downsampled = downsample(chan_filtered, 4);
    mtx(i, :) = chan_downsampled;
end

% mtx_norm = normalize(mtx, "center", "mean", "scale");

[coeff,score,latent,tsquared,explained,mu] = pca(mtx);
idx = find(cumsum(explained)>=90,1);
fprintf("Num components for 90%% variance:%d\n", idx);

% [pc, eigvec, sv] = runpca(mtx_norm);
% 
% D = diag(sv).^2;
% variance_explained = D./sum(D);
% 
% i = 1; v = 0;
% while v < 0.9
%     v = v + variance_explained(i);
%     fprintf("Variance explained by component %d: %f\n", i, variance_explained(i));
%     i = i + 1;
% end
% 
% fprintf("Num Components for 90%% Variance: %d\n", i);

% [coeff,score,latent,tsquared,explained,mu] = pca(mtx_norm);

