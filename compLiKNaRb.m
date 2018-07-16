figure
hold on
% plot(sc1k);
% plot(xtempk,ycentre1k, '.k','Markersize',10);
plot(sc1l);
plot(xtempl,ycentre1l, '.c','Markersize',10);
plot(sc2l);
plot(xtempl,ycentre2l, '.c','Markersize',10);
plot(sc3l);
plot(xtempl,ycentre3l, '.c','Markersize',10);
plot(sc1n);
plot(xtempn,ycentre1n, '.g','Markersize',10);
plot(sc1k4);
plot(xtempk4,ycentre1k4, '.b','Markersize',10);
plot(sc1R);
plot(xtempR,ycentre1R, '.r','Markersize',10);
% plot(sc1c);
% plot(xtempc,ycentre1c, '.y','Markersize',10);

title ('Peak position');
xlabel('Temperature ($^o$C)')
ylabel('Centre Position (cm$^{-1}$)');
hold off

figure
hold on
for i=1:length(ycentre1l)
    ycentre1l_frac(i,1)=ycentre1l(i)/ycentre1l(1);
    %ycentre1l_frace(i,1)=ycentre1el(i)/ycentre1el(1);
    ycentre1l_diff(i,1)=ycentre1l(i)-ycentre1l(1);
end
plot(xtempl,ycentre1l_frac, '.k','Markersize',10);

for i=1:length(ycentre2l)
    ycentre2l_frac(i,1)=ycentre2l(i)/ycentre2l(1);
    %ycentre2l_frace(i,1)=ycentre2el(i)/ycentre2el(1);
    ycentre2l_diff(i,1)=ycentre2l(i)-ycentre2l(1);
end
plot(xtempl,ycentre2l_frac, '.k','Markersize',10);

for i=1:length(ycentre3l)
    ycentre3l_frac(i,1)=ycentre3l(i)/ycentre3l(1);
    %ycentre3l_frace(i,1)=ycentre3el(i)/ycentre3el(1);
    ycentre3l_diff(i,1)=ycentre3l(i)-ycentre3l(1);
end
plot(xtempl,ycentre3l_frac, '.c','Markersize',10);

for i=1:length(ycentre1n)
    ycentre1n_frac(i,1)=ycentre1n(i)/ycentre1n(1);
    %ycentre1n_frace(i,1)=ycentre1en(i)/ycentre1en(1);
    ycentre1n_diff(i,1)=ycentre1n(i)-ycentre1n(1);
end
plot(xtempn,ycentre1n_frac, '.g','Markersize',10);

for i=1:length(ycentre1k4)
    ycentre1k4_frac(i,1)=ycentre1k4(i)/ycentre1k4(1);
    %ycentre1k4_frace(i,1)=ycentre1ek4(i)/ycentre1ek4(1);
    ycentre1k4_diff(i,1)=ycentre1k4(i)-ycentre1k4(1);
end
plot(xtempk4,ycentre1k4_frac, '.m','Markersize',10);

for i=1:length(ycentre7k4)
    ycentre7k4_frac(i,1)=ycentre7k4(i)/ycentre7k4(1);
    %ycentre1k4_frace(i,1)=ycentre1ek4(i)/ycentre1ek4(1);
    ycentre7k4_diff(i,1)=ycentre7k4(i)-ycentre7k4(1);
end
plot(xtempk4,ycentre7k4_frac, '.y','Markersize',10);

for i=1:length(ycentre1R)
    ycentre1R_frac(i,1)=ycentre1R(i)/ycentre1R(1);
    %ycentre1R_frace(i,1)=ycentre1eR(i)/ycentre1eR(1);
    ycentre1R_diff(i,1)=ycentre1R(i)-ycentre1R(1);
end
plot(xtempR,ycentre1R_frac, '.r','Markersize',10);

for i=1:length(ycentre1c)
    ycentre1c_frac(i,1)=ycentre1c(i)/ycentre1c(1);
    %ycentre1R_frace(i,1)=ycentre1eR(i)/ycentre1eR(1);
    ycentre1c_diff(i,1)=ycentre1c(i)-ycentre1c(1);
end
plot(xtempc,ycentre1c_frac, '.b','Markersize',10);
title ('Fractional peak position');
xlabel('Temperature ($^o$C)')
ylabel('Centre Position (cm$^{-1}$)');
hold off

figure
hold on
plot(xtempl,ycentre3l_diff, '.c','Markersize',10);
plot(xtempn,ycentre1n_diff, '.g','Markersize',10);
plot(xtempk4,ycentre1k4_diff, '.b','Markersize',10);
plot(xtempR,ycentre1R_diff, '.r','Markersize',10);
title ('Change in superstructure peak position');
xlabel('Temperature ($^o$C)')
ylabel('Centre Position (cm$^{-1}$)');
hold off


figure 
hold on
% plot(sw1k);
% plot(xtempk,ywidth1k, '.k','Markersize',10);
plot(sw1l);
plot(xtempl,ywidth1l, '.k','Markersize',10);
plot(sw2l);
plot(xtempl,ywidth2l, '.k','Markersize',10);
plot(sw3l);
plot(xtempl,ywidth3l, '.c','Markersize',10);
plot(sw1n);
plot(xtempn,ywidth1n, '.g','Markersize',10);
plot(sw1k4);
plot(xtempk4,ywidth1k4, '.b','Markersize',10);
plot(sw7k4);
plot(xtempk4,ywidth7k4, '.m','Markersize',10);
plot(sw1R);
plot(xtempR,ywidth1R, '.r','Markersize',10);
plot(sw1c);
plot(xtempc,ywidth1c, '.y','Markersize',10);
% title ('Change in 200cm$^{-1}$ FWHM');
title ('Change in superstructure FWHM');
xlabel('Temperature ($^o$C)')
ylabel('FWHM (cm$^{-1}$)');
hold off

% figure 
% hold on
% plot(sc1k);
% plot(sc1k4);
% plot(xtempk,ycentre1k, '.k', xtempk4,ycentre1k4, '.b','Markersize',10);
% title ('Change in 200cm$^{-1}$ position for K$_{0.4}$ and K$_{0.6}$ MoS$_2$');
% xlabel('Temperature ($^o$C)')
% ylabel('Centre Position (cm$^{-1}$)');
% hold off