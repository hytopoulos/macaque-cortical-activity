folderPath = '/Users/theo/Downloads/eeglab2023.1/data';
mtx = zeros(128, ceil(2287093 / 4));

files = dir(fullfile(folderPath, 'LFP_ch*.mat'));
for i = 1:length(files)
    fileName = files(i).name;
    filePath = fullfile(folderPath, fileName);

    % Load the .mat file data
    data = load(filePath);
    mtx(i, :) = downsample(data.LFP, 4);
end
