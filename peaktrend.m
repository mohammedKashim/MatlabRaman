for i=1:NOF
    tempsp=strsplit(temp{i},'C');
    tempnum{i,1}=str2num(tempsp{1});   
end
xtemp=cell2mat(tempnum(:,1)); 

figure
hold on
ycentre3=cell2mat(centre(:,3));
ycentre3e=cell2mat(centree(:,3));
sc3=spec1d(xtemp,ycentre3,ycentre3e);
plot(xtemp,ycentre3, '.k','Markersize',10);
plot(sc3);
title ('Change in 200cm$^{-1}$ peak position');
xlabel('Temperature ($^o$C)')
ylabel('Centre Position (cm$^{-1}$)');
hold off

figure 
hold on
ywidth3=cell2mat(width(:,3))*2;
ywidth3e=cell2mat(widthe(:,3))*2;
sw3=spec1d(xtemp,ywidth3,ywidth3e);
plot(sw3);
plot(xtemp,ywidth3, '.k','Markersize',10);
title ('Change in 200cm$^{-1}$ FWHM');
xlabel('Temperature ($^o$C)')
ylabel('FWHM (cm$^{-1}$)');
hold off

%figure for BWF peak
% figure
% hold on
% for i=1:NOF;
%     clear y
% y=BWF(x,[cell2mat(intensity(i,1)) cell2mat(centre(i,1)) cell2mat(width(i,1))  cell2mat(invq(i,1)) cell2mat(grad(i,1)) cell2mat(bg(i,1)) ]);
% plot(x,y,'b')
% end

figure
hold on
legendnames=[];
for i=1:NOF;
    clear y
y=BWF(x,[(cell2mat(intensity(i,3))-cell2mat(bg(i,3)))/(cell2mat(intensity(i,3))-cell2mat(bg(i,3))) cell2mat(centre(i,3)) cell2mat(width(i,3))  cell2mat(invq(i,3)) 0 i/3 ]);
CM = winter(NOF);
eval(['h' num2str(i) '=plot(x,y,''color'',CM (i,:));'])
%legendnames=[legendnames; 'h' num2str(i)]
   set(gca,'YTickLabel',{' '})
xlim([390 420])
legendInfo3{i} = [num2str(tempnum{i}) 'C'];

end

legend([h9,h8,h7,h6,h5,h4,h3,h2,h1],fliplr(legendInfo3))

%legendInfo1=fliplr(legendInfo1);
% hleg=legend(legendInfo1);
%legend(reorderLegend)

hold off

