%% Calculate the intensities within each ROIs
% Get pathname if not in workspace already
if ~exist('pathname','var')
    disp('Please specify image location.')
    [~, pathname] = uigetfile('.tif');
end

% Get ROI data if not in workspace already
if ~exist('ROIs','var')
    disp('Please load the .mat file generated by ROIselect.')
    [matfilename, matpathname] = uigetfile(fullfile(pathname,'.mat'));
    load(fullfile(matpathname,filename));
end

absoluteintensity = zeros(nfiles,2);

for i = 1: nfiles
    % Read the file
    im = imread( fullfile( pathname , filenames{ i }));
     
    % Calculate the intensities
    absoluteintensity(i,1) = mean(im(ROIs{i,1}));
    absoluteintensity(i,2) = mean(im(ROIs{i,2}));

end

