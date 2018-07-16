
%data='-195C -150C -100C_2 -80C -60C -40C -20C 0C 20C 50C 100C 150C 200C';
data='-195C -150C -100C_2 -50C_day5 0C 50C 100C 150C 200C';
temp=strsplit(data, ' ');
NOF=length(temp);
intensity=[];
centre=[];
width=[];
bg=[];
fitteddata=[];
fittedparameters=[];


for i=1:NOF
figure
hold on
filename=['K0.6MoS2_x20_50pc_5s_100acq_spot1_' temp{i} '.txt'];
w1=importdata(filename);
x=w1(:,1);
y=w1(:,2);
s1=spec1d(x,y,sqrt(abs(y)));
h=plot(x,y,'.b','Linewidth',3,'Markersize',3);


%select linear background
xlim([120 280])
% linepoint1=ginput(2);
% grad1=(linepoint1(2,2)-linepoint1(1,2))/(linepoint1(2,1)-linepoint1(1,1));
% intercept1=linepoint1(1,2)-(grad1*linepoint1(1,1));
grad1=(w1(360,2)-w1(475,2))/(w1(360,1)-w1(475,1));
intercept1=w1(475,2)-(grad1*w1(475,1));
%xlim([325 450])
%linepoint=ginput(2);
grad2=(w1(242,2)-w1(308,2))/(w1(242,1)-w1(308,1));
%grad=(linepoint(2,2)-linepoint(1,2))/(linepoint(2,1)-linepoint(1,1));
%intercept=linepoint(1,2)-(grad*linepoint(1,1));
intercept2=w1(308,2)-(grad2*w1(308,1));


if i<=1
pin1= [2000 200 3 0 grad1 intercept1 1000 197 3];
[so1,sf1]=fits(cut(s1, [140 280]), 'BWFmulti',pin1, [1 1 1 1 1 1 1 1 1]);

intensity{i,1}=sf1.pvals(1);
centre{i,1}=abs(sf1.pvals(2));
width{i,1}=abs(sf1.pvals(3));
bg{i,1}=sf1.pvals(6);
fitteddata{i,1}=so1;
fittedparameters{i,1}=sf1;

intensity{i,2}=sf1.pvals(7);
centre{i,2}=abs(sf1.pvals(8));
width{i,2}=abs(sf1.pvals(9));
bg{i,2}=sf1.pvals(6);
fitteddata{i,2}=so1;
fittedparameters{i,2}=sf1;
else
pin1= [2000 200 3 0 grad1 intercept1];
[so1,sf1]=fits(cut(s1, [140 280]), 'BWFmulti',pin1, [1 1 1 1 1 1]);

intensity{i,1}=sf1.pvals(1);
centre{i,1}=abs(sf1.pvals(2));
width{i,1}=abs(sf1.pvals(3));
bg{i,1}=sf1.pvals(6);
fitteddata{i,1}=so1;
fittedparameters{i,1}=sf1;

end


if i<=14
pin2= [25000 355 3 0 grad2 intercept2  30000 367 3 31000 374 3  45000 384.5 3  30000 390 3 20000 400 5  45000 410 4];
[so2,sf2]=fits(cut(s1, [345 425]), 'BWFmulti',pin2, [1 1 1 0 0 0  1 1 1  1 1 1  1 1 1  1 1 1  1 1 1  1 1 1]);
else
pin2= [31000 374 3  0 grad2 intercept2  45000 384.5 3  20000 400 5  45000 410 4]; 
[so2,sf2]=fits(cut(s1, [345 425]), 'BWFmulti',pin2, [1 1 1 0 0 0  1 1 1  1 1 1  1 1 1]);
end


%kplot1
plot(s1)
plot(so1)
pv1=sf1.pvals;
v=axis;
info1=[sf1.pnames num2str(pv1)];
text(v(1)+.25*(v(2)-v(1)),v(3)+.8*(v(4)-v(3)),info1)

[x1,~,e1,yfitt1]=extract(so1);
plot(1,yfitt1,'r','LineWidth',2)
y1=BWF(x1,[pv1(1:4); pv1(5:6)]);
plot(x1,y1,'b')

x1=min(x1):0.01:max(x1);
off=6;

nlorzes1=(length(pv1)-off)/3;
for lzid=0:(nlorzes1-1)
y1=pv1(off+1+3*lzid)*pv1(off+3+3*lzid)^2 ./...
    (pv1(off+3+3*lzid)^2 + (x1-pv1(off+2+3*lzid)).^2 );
    y1=y1+x1*pv1(5)+pv1(6);
    plot(x1,y1,'-g')        
end


%kplot2
% plot(so2)
% pv2=sf2.pvals;
% v=axis;
% info2=[sf2.pnames num2str(pv2)];
% text(v(1)+.53*(v(2)-v(1)),v(3)+.8*(v(4)-v(3)),info2)
% 
% [x2,~,e2,yfitt2]=extract(so2);
% plot(x2,yfitt2,'r','LineWidth',2)
% y2=BWF(x2,[pv2(1:4); pv2(5:6)]);
% plot(x2,y2,'b')
% 
% x2=min(x2):0.01:max(x2);
% off=6;
% 
% nlorzes2=(length(pv2)-off)/3;
% for lzid=0:(nlorzes2-1)
% y2=pv2(off+1+3*lzid)*pv2(off+3+3*lzid)^2 ./...
%     (pv2(off+3+3*lzid)^2 + (x2-pv2(off+2+3*lzid)).^2 );
%     y2=y2+x2*pv2(5)+pv2(6);
%     plot(x2,y2,'-g')   
%     
% end

xlim([130 250])
set(gcf,'position',[5 5 1250 1000])
tempsp=strsplit(temp{i},'C');
title ([tempsp{1} 'C']);
xlabel('Raman shift/cm$^{-1}$')
ylabel('Intensity (arb. units)');
hold off
end

