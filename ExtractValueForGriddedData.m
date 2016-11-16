clear; clc;
xycoords = xlsread('trmmlatlon.xls');
lat_loc=xycoords(:,1);
lon_loc=xycoords(:,2);
%%%%%% load lat/lon matrices 
lat=load('C:\Users\Aneela\Documents\MATLAB\LoretoPaper\TRMM\YearlyData\entire_lat.mat');
lon=load('C:\Users\Aneela\Documents\MATLAB\LoretoPaper\TRMM\YearlyData\entire_lon.mat');
lat=(lat.entire_lat(:));
lon=(lon.entire_lon(:));
%identify where the location is
for i=1:length(lat_loc)
    diff_lat=(abs(lat_loc(i)-lat));
    klat(i)=find(diff_lat==min(diff_lat));
    diff_lon=(abs(lon_loc(i)-lon));
    klon(i)=find(diff_lon==min(diff_lon));
end

Precip_LoretoHealthCenters2000_2014=[];
for year=2000:2014
    load(['C:\Users\Aneela\Documents\MATLAB\LoretoPaper\TRMM\YearlyData\PeruPrec', num2str(year, '%4.4d'),'.mat'])
    for kk=1:length(klat)    
        dummy(kk,:)=squeeze(Prec(klat(kk),klon(kk),:));
    end
    Precip_LoretoHealthCenters2000_2014=cat(2,Precip_LoretoHealthCenters2000_2014,dummy);
    clear dummy filename fname*
    end