clear all
close all
clc

size = 10*[1 2 3 4]; size = size';
ndof = zeros(7,4);
pmin = ndof; pmax = ndof; dragr = ndof; dragz = ndof;

for i=1:4
    filename = strcat('exterior size-', num2str(i*10), '.txt');
    A = importdata(filename,' ');
    ndof(:,i) = A.data(:,1);
    pmin(:,i) = A.data(:,2);
    pmax(:,i) = A.data(:,3);
    dragr(:,i) = A.data(:,4);
    dragz(:,i) = A.data(:,5);
end

figure(1)
hold off
for i=1:4
    loglog(ndof(:,i),abs( dragz(:,i)-1 ),'.-' );
    hold on
end
legend(num2str(size));
xlabel('Number of dofs');
ylabel('error(percent)');
title('drag force(z component)');

figure(2)
hold off
for i=1:4
    loglog(ndof(:,i),abs( dragr(:,i) ),'.-' );
    hold on
end
legend(num2str(size));
xlabel('Number of dofs');
ylabel('error(percent)');
title('drag force(r component)');

figure(3)
hold off
for i=1:4
    loglog(ndof(:,i),abs( pmax(:,i)-1.5 ),'.-' );
    hold on
end
legend(num2str(size));
xlabel('Number of dofs');
ylabel('error(non-dimensionalized)');
title('max pressure');

figure(4)
hold off
for i=1:4
    loglog(ndof(:,i),abs( pmin(:,i)+1.5 ),'.-' );
    hold on
end
legend(num2str(size));
xlabel('Number of dofs');
ylabel('error(non-dimensionalized)');
title('min pressure');