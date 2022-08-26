
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Figure 5
clear all;clc

filename=strcat('S1A_IW_OCN__2SDV_20210720T220129_20210720T220154_038867_04961F_4161.nc');
% ncdisp(filename);
RadVel=ncread(filename,'vv_001_owiRadVel');
 lonimg =ncread(filename,'lon');
 latimg =ncread(filename,'lat');
lonimg=(rot90(lonimg,1));
latimg=(rot90(latimg,1));
lon1=mean(lonimg)';
lat1=mean(latimg,2);
RadVel=(rot90(RadVel,1));

RadVel(find(RadVel>3))=NaN;
RadVel(:,any(isnan(RadVel))) = [];
y=RadVel(90,:);y(find(isnan(y)))=[];

 figure('Color',[1 1 1]);
imagesc(lon1,lat1,RadVel);set(gca,'YDir','normal');
xlabel('Lon (Unit: бу)');
ylabel('Lat (Unit: бу)');
ylabel(colorbar,'Doppler Velocity (Unit: m/s)')
box on;
hold on
plot([-62.69,-59.33],[39.4,39.4],'k','linewidth',5);
text(-63.1,39.9,'Azimuth','rotation',90,'FontWeight','bold');
text(-62.3,40.45,'Range','FontWeight','bold');
annotation('arrow',[0.07,0.07],[0.95,0.6]);
annotation('arrow',[0.07,0.33],[0.95,0.95]);

figure('Color',[1 1 1]);
plot(y,'k');grid on
xlabel('Grid');ylabel('Doppler Velocity (Unit: m/s)');
set(gca,'XLim',[0 255]); 

%%%%%%%%%%%% Figure 5a & 5c
%%%%%%%%%%%% Figure 5b & 5d

clear all;clc

filename=strcat('S1A_IW_OCN__2SDV_20211107T232019_20211107T232044_040472_04CC7C_AFE6.nc');
% ncdisp(filename);
RadVel=ncread(filename,'vv_001_owiRadVel');
 lonimg =ncread(filename,'lon');
 latimg =ncread(filename,'lat');
lonimg=(rot90(lonimg,1));
latimg=(rot90(latimg,1));
lon1=mean(lonimg)';
lat1=mean(latimg,2);
RadVel=(rot90(RadVel,1));

RadVel(find(RadVel<-2.5))=NaN;
RadVel(:,any(isnan(RadVel))) = [];
y=RadVel(1:100,15);y(find(isnan(y)))=[];

 figure('Color',[1 1 1]);
imagesc(lon1,lat1,RadVel);set(gca,'YDir','normal');
xlabel('Lon (Unit: бу)');
ylabel('Lat (Unit: бу)');
colormap(flipud(jet));
ylabel(colorbar,'Doppler Velocity (Unit: m/s)')
box on;
hold on
plot([-80.25,-80.25],[25.6,26.9],'r','linewidth',5);
text(-80.7,27,'Azimuth','rotation',90,'FontWeight','bold');
text(-80,27.8,'Range','FontWeight','bold');
annotation('arrow',[0.07,0.07],[0.95,0.6]);
annotation('arrow',[0.07,0.33],[0.95,0.95]);

figure('Color',[1 1 1]);
plot(y,'r');grid on
xlabel('Grid');ylabel('Doppler Velocity (Unit: m/s)');
set(gca,'XLim',[0 255]); 



