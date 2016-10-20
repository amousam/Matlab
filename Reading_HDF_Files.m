%% This code reads .hdf files from NASA MERRA Models and saves them as .mat files. 
clear
clc
% All the data for surface temperature(TS) were downloaded for 2000 from
% the NASA Merra website. The data are .hdf files which are saved in the
% following directory. 
fileList = dir('C:\Users\Aneela\Documents\MATLAB\LoretoPaper\RawData\TS\RawData\2000');
nFiles = length(fileList);
filename=fileList(3);
TS2000 = hdfread(filename.name,'ts') % look at the meta data to determine the variable name in the .hdf file. In case of TS, the 
%variable was 'ts'
for iFile = 4:(nFiles)
    
      filename=fileList(iFile);

     file2 = hdfread(filename.name,'ts');        
     TS2000 = cat(3, TS2000, file2);
     clear filename
        
end 
save ('TS2000.mat', 'TS2000') %This will save all the data for 2000 in one .mat file. 
clear 
clc 