% Get the folder directory
if exist('pathname','var')
    [~, pathname] = uigetfile(fullfile(pathname,'.tif'));
else
    [~, pathname] = uigetfile('.tif');
end

% Get the list of the tif files in the folder
contents = dir( fullfile( pathname , '*.tif' ) );

% Get the file names
filenames = { contents.name }';

% Count the number of files
nfiles = length( filenames );

% Initialize the ROI cell
ROIs = cell( nfiles , 2 );

% Loop through files
for i = 1 : nfiles
    
    % Get current file name
    filename = filenames{ i };
    
    % Read the image
    im = imread( fullfile( pathname , filename ) , 1);
    
    % Use getpoly to get the polygon ROI
    ROIs{i,1} = getpoly(im, [filename,' - select ROI']);
    
    % Use getpoly to get the background
    ROIs{i,2} = getpoly(im, [filename,' - select background']);
    
end

%%

% Save all the ROIs
save( fullfile ( pathname , ['ROIs - ', datestr(clock,30) , '.mat' ] ) ) ;