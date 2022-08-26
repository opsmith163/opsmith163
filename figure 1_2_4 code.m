clear all;clc

load 20070714.mat
imagesc(Dc);set(gca,'YDir','normal');colorbar

DC=flipud(fliplr(Dc));
DC(find(DC>0))=NaN;
DC(find(DC<-900))=NaN;
[n,m]=size(DC);
%% Figure.1a
figure('Color',[1 1 1]);
imagesc(DC);set(gca,'YDir','normal');;
xlabel('Grid');
ylabel('Grid');
ylabel(colorbar,'Doppler Shift (Unit: Hz)');
hold on
plot([1,100],[15,15],'k','linewidth',2);text(90,15-2,'A','FontWeight','bold','FontSize',15);
plot([1,100],[30,30],'k','linewidth',2);text(90,30-2,'B','FontWeight','bold','FontSize',15);
plot([1,100],[50,50],'k','linewidth',2);text(90,50-2,'C','FontWeight','bold','FontSize',15);
plot([20,20],[1,52],'w','linewidth',4);text(20-5,45,'D','FontWeight','bold','Color','white','FontSize',15);
plot([40,40],[1,52],'w','linewidth',4);text(40-5,45,'E','FontWeight','bold','Color','white','FontSize',15);
plot([60,60],[1,52],'w','linewidth',4);text(60-5,45,'F','FontWeight','bold','Color','white','FontSize',15);
text(-11,40,'Azimuth','rotation',90,'FontWeight','bold','FontSize',15);
text(10,55.5,'Range','FontWeight','bold','FontSize',15);
annotation('arrow',[0.07,0.07],[0.95,0.6]);
annotation('arrow',[0.07,0.33],[0.95,0.95]);


%% Figure.1b

x=DC(15,:);x(find(isnan(x)))=[];
y=DC(30,:);y(find(isnan(y)))=[];
z=DC(50,:);z(find(isnan(z)))=[];

xx=[1:1:m];
p1=polyfit(xx,x,1);
x1=polyval(p1,xx);
p2=polyfit(xx,y,1);
y1=polyval(p2,xx);
p3=polyfit(xx,z,1);
z1=polyval(p3,xx);

figure('Color',[1 1 1]);
subplot(1,3,1)
plot(xx,x,'O');grid on
hold on 
plot(xx,x1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 100]); 
text(30,-750,['y= ',num2str(p1(1)),' x ',num2str(p1(2))],'FontSize',10);
title('A');

subplot(1,3,2)
plot(xx,y,'*');grid on
hold on 
plot(xx,y1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 100]); 
text(30,-700,['y= ',num2str(p2(1)),' x ',num2str(p2(2))],'FontSize',10);
title('B');

subplot(1,3,3)
plot(xx,z,'rO');grid on
hold on 
plot(xx,z1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 100]); 
text(30,-700,['y= ',num2str(p3(1)),' x ',num2str(p3(2))],'FontSize',10);
title('C');


%%  Figure.1c

clear x y z x1 y1 z1 xx;
imagesc(DC);set(gca,'YDir','normal');colorbar;

x=DC(:,20)';x(find(isnan(x)))=[];
y=DC(:,40)';y(find(isnan(y)))=[];
z=DC(:,60)';z(find(isnan(z)))=[];

xx=[1:1:n];
p1=polyfit(xx,x,1);
x1=polyval(p1,xx);
p2=polyfit(xx,y,1);
y1=polyval(p2,xx);
p3=polyfit(xx,z,1);
z1=polyval(p3,xx);

figure('Color',[1 1 1]);
subplot(1,3,1)
plot(xx,x,'O');grid on
hold on 
plot(xx,x1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 52]); 
text(20,-800+10,['y= ',num2str(p1(1)),' x ',num2str(p1(2))],'FontSize',10);
title('D');

subplot(1,3,2)
plot(xx,y,'*');grid on
hold on 
plot(xx,y1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 52]); 
text(20,-800+10,['y= ',num2str(p2(1)),' x ',num2str(p2(2))],'FontSize',10);
title('E');

subplot(1,3,3)
plot(xx,z,'rO');grid on
hold on 
plot(xx,z1);
xlabel('Grid');ylabel('Doppler Shift (Unit: Hz)');
set(gca,'XLim',[0 52]); 
text(20,-700+10,['y= ',num2str(p3(1)),' x ',num2str(p3(2))],'FontSize',10);
title('F');




%% Figure 2
clear all;clc

load 20070714.mat
imagesc(Dc);set(gca,'YDir','normal');colorbar

DC=flipud(fliplr(Dc));
DC(find(DC>0))=NaN;
DC(find(DC<-900))=NaN;
[n,m]=size(DC);

for i=1:1:n
DCaz(i,:)=DC(i,:)-nanmean(DC(i,:));
end
for i=1:1:m
   DC_RG(1:52,i)=nanmean(DCaz(:,i));
DCrg(:,i)=DC(:,i)-nanmean(DCaz(:,i));

end

for i=1:1:n
    DC_AZ(i,1:100)=nanmean(DCrg(i,:));
 DCA(i,:)=DCrg(i,:)-nanmean(DCrg(i,:));
end

%%%%%% Fig 2a
figure('Color',[1 1 1]);
imagesc(DC_AZ);set(gca,'YDir','normal');colorbar;
xlabel('Range Grid');
ylabel('Azimuth Grid');
ylabel(colorbar,'Doppler Shift (Unit: Hz)');

%%%%%% Fig 2b
figure('Color',[1 1 1]);
imagesc(DC_RG);set(gca,'YDir','normal');colorbar;
xlabel('Range Grid');
ylabel('Azimuth Grid');
ylabel(colorbar,'Doppler Shift (Unit: Hz)');

%% Figure 4

DCA(find(DCA>50))=NaN;
DCA(find(DCA<-50))=NaN;

x2=DCA(50,40:90);x2(find(isnan(x2)))=[];
y2=DCA(30,40:90);y2(find(isnan(y2)))=[];

x3=DCA(20:50,50);x3(find(isnan(x3)))=[];
y3=DCA(20:50,80);y3(find(isnan(y3)))=[];

 figure('Color',[1 1 1]);
h=imagesc(DCA);set(gca,'YDir','normal');
xlabel('Range Grid');
ylabel('Azimuth Grid');
ylabel(colorbar,'Doppler Shift (Unit: Hz)');
set(h,'alphadata',~isnan(DCA));
hold on
plot([40,90],[50,50],'k','linewidth',2);text(90,50-1,'A','FontWeight','bold','FontSize',15);
plot([40,90],[30,30],'k','linewidth',2);text(90,30-1,'B','FontWeight','bold','FontSize',15);
plot([50,50],[20,50],'r','linewidth',4);text(50-3,45,'C','FontWeight','bold','FontSize',15);
plot([80,80],[20,50],'r','linewidth',4);text(80-3,45,'D','FontWeight','bold','FontSize',15);
text(5,8,'Zhejiang','FontWeight','bold','FontSize',20,'FontAngle','italic','Color',[0.5 0.5 0.5]);
text(3,47,'Shanghai','FontWeight','bold','FontSize',20,'FontAngle','italic','Color',[0.5 0.5 0.5]);
text(8,27,'Hangzhou Bay','FontWeight','demi','FontSize',17,'FontAngle','italic','Color',[0 0.4470 0.7410]);

%%% fig 4b
figure('Color',[1 1 1]);
subplot(1,2,1)
plot(x2);grid on
xlabel('Grid');
ylabel('Doppler Shift (Unit: Hz)');
title('A');
subplot(1,2,2)
plot(y2);grid on
xlabel('Grid');
ylabel('Doppler Shift (Unit: Hz)');
title('B');


%%% fig 4c
figure('Color',[1 1 1]);
subplot(1,2,1)
plot(x3);grid on
xlabel('Grid');
ylabel('Doppler Shift (Unit: Hz)');
title('C');
subplot(1,2,2)
plot(y3);grid on
xlabel('Grid');
ylabel('Doppler Shift (Unit: Hz)');
title('D')