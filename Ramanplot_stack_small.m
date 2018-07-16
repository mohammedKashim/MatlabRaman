clear all

%NOF=input('Please enter the number of files: ', 's');
figure
hold on
%data='-195C -150C -100C_2 -80C -60C -50C_ -20C 0C 20C 50C 100C 150C 200C';
%data='-195C -150C -100C_2 -50C_day5 0C 50C 100C 150C 200C';
data='-195C -150C -100C_2 -50C_day5 0C 50C';
temp=strsplit(data, ' ');
NOF=length(temp);
for i=1:NOF
    %filename = input('Please type temperature: ', 's');
    filename=['K0.6MoS2_x20_50pc_5s_100acq_spot1_' temp{i} '.txt'];
    w1=importdata(filename);
    x=w1(:,1);
    y=w1(:,2);
    %normalise to peak
    t1=find(x>140);
    t2=find(x<250);
    t3=intersect(t1,t2);
    xtemp=x(t3);
    ytemp=y(t3);
    norm=max(ytemp);
    y=y/norm;
    %set plot colour
    CM = winter(NOF);
    eval(['h' num2str(i) '= plot(x,y+i*0.2,''color'',CM (i,:));'])
    %h{i} = plot(x,y+(i-1)*0.25,'color',CM (i,:));+(i-1)*0.1
    %remove y-axis
    set(gca,'YTickLabel',{' '})
    %form legend
    lgd=strsplit(temp{i}, '_');
    legendInfo{i} = lgd{1};
end
xlim([125 550])
legend([h6,h5,h4,h3,h2,h1],fliplr(legendInfo))
%legend(legendInfo)
%legend(reorderLegend)
%legend(flipud(h))
ttl=strsplit(filename, '_');
set(gca,'FontSize',30,'linewidth',3)
%title ('Normalised temperature dependant Raman spectra');
xlabel('Raman shift/cm^{-1}')
ylabel('Intensity/arb. units');
hold off

%set(gcf,'position',[10 10 200 1000])