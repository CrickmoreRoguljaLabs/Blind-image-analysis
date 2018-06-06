% Get the folder directory
if exist('pathname','var')
    [~, pathname] = uigetfile(fullfile(pathname,'.tif'));
else
    [~, pathname] = uigetfile('.tif');
end

% Make a folder to contain blinded images
mkdir(pathname,'Blinded')

% Get the list of the tif files in the folder
contents = dir(fullfile(pathname,'*.tif'));

% Get the file names
filenames = {contents.name}';

% Count the number of files
nfiles = length(filenames);

% Generate a random order
randorder = randperm(nfiles);

for i = 1 : nfiles
    % Determine the name of the source file
    sourcefile = fullfile(pathname,filenames{i});
    
    if randorder(i)<10
        % Determine the name of the destination file
        destfile = fullfile(pathname, 'Blinded', ['00', num2str(randorder(i)),'.tif'] );
    elseif randorder(i)<100
        % Determine the name of the destination file
        destfile = fullfile(pathname, 'Blinded', ['0', num2str(randorder(i)),'.tif'] );
    else
        % Determine the name of the destination file
        destfile = fullfile(pathname, 'Blinded', [ num2str(randorder(i)),'.tif'] );
    end
    
    % Copy and rename the file
    copyfile(sourcefile,destfile);
    
end

% Generate the key
key = [num2cell(randorder)',filenames];

% Save the data
save(fullfile(pathname,'key.mat'));

