%画曲面
x = linspace(-2,2,100);
y = linspace(-2,2,100);
[X,Y] = meshgrid(x,y);
Z = sin(X).*cos(Y);
h1 = surf(X,Y,Z,'EdgeColor','b','EdgeAlpha',0.2,'FaceColor','b','FaceAlpha',0.2);
hold on;

%画x=x0=1的平面
x0 = 1;
[Yp,Zp] = meshgrid(linspace(-2,2,100),linspace(-1,2,50),100);
Xp = x0*ones(size(Yp));
h2 = surf(Xp,Yp,Zp,'EdgeColor','r','EdgeAlpha',0.2,'FaceAlpha',0.2,'FaceColor','r');

%画相交曲线
y_line = linspace(-2,2,100);
x_line = x0 * ones(size(y_line));
z_line = sin(x0).*cos(y_line);
h3 = plot3(x_line,y_line,z_line,'k','Linewidth',2);

%画关于y的偏导函数曲线
dz = -sin(1).*sin(y_line);
h4 = plot3(x_line,y_line,dz,'g','Linewidth',2);

%画切点
z2 = sin(1).*cos(-0.5);
h5 = plot3(x0,y1,z2,'g','Marker','.','MarkerSize',30);

%画在x=x0面内的切线
z1 = sin(1).*sin(0.5).*(y_line+0.5)+sin(x0).*cos(-0.5);
h6 = plot3(x_line,y_line,z1,'m','linewidth',2);




xlabel('x');
ylabel('y');
zlabel('z');
grid on;
axis equal;

legend([h1,h2,h3,h4,h5,h6],...
    ["空间曲面",
    "平面x=x0",
     "相交曲线",
    "曲面关于y的偏导函数",
    "切点",
    "切线"
    ],...
'Location','best');

hold off;






