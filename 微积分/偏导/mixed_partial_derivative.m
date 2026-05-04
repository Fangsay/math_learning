  %设置坐标轴
  x = linspace(-4,4,100);
  y = linspace(-4,4,100);
  [X,Y] = meshgrid(x,y);
  Z = X.*Y;
  
  %设置初始画布
  fig = figure('Name','混合偏导示例');
  hold on;grid on;axis equal;
  xlabel('x');ylabel('y');zlabel('z');
  title('混合偏导示例');
  xlim([-4,4]);ylim([-4,4]);zlim([-4,4]);
  view(3);

  %画曲面
  h1 = surf(X,Y,Z,'FaceColor','b','FaceAlpha',0.2,'EdgeAlpha',0.2,'DisplayName','曲面');

  %画移动轨迹
  x_locus = x;
  y_locus = 0*ones(size(y));
  z_locus = y_locus;
  h2 = plot3(x_locus,y_locus, z_locus,'m','Linewidth',2,'DisplayName','轨迹');
  
  %画混合偏导函数
  dxy = 1;
  Zd = -4.*ones(size(x));
  Yd = y;
  Xd = dxy*Yd;
  h3 = plot3(Xd,Yd,Zd,'r','Linewidth',2,'DisplayName','偏导函数');
  
  %设置滑块
  x0 = 4;
  sld = uicontrol(fig,'style','slider','Position',...
  [80,20,200,20],'Min',-4,'Max',4,'Value',x0,'Callback',@update_fig);
  
  %初始更新画布
  update_fig;

  %设置图例
  legend('location','best');
    
  %导出参数设置
  filename = 'mixed_partial_derivative_xy.gif';  
  delayTime = 0.05;           
  frameNum = 120;               

%设置动画
try  
  while true 
    for x0 = linspace(-4,4,100)
        set(sld,'Value',x0);
        update_fig;
        pause(0.05);
% %导出为.gif          
%           frame = getframe(fig);
%           im = frame2im(frame);
%           [imind, cm] = rgb2ind(im, 256);
%           
%           if x0 == -4
%             imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', delayTime);
%           else
%             imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
%           end
        end
%         close(fig); % 生成完成自动关闭窗口
  end     
end

%更新画布
function update_fig(~,~)
  global  h_point h_sec h_tangent sld

  x = linspace(-4,4,100);
  y = linspace(-4,4,100);
  z = linspace(-4,4,100);
  x0 = get(sld,'Value');
  
  if ~isempty(h_point), delete(h_point); end
  if ~isempty(h_tangent), delete(h_tangent); end
  if ~isempty(h_sec), delete(h_sec); end
  
  [Yp,Zp] = meshgrid(y,z);
  Xp = x0*ones(size(y));
  h_sec = surf(Xp,Yp,Zp,'FaceColor','g','FaceAlpha',0.3,'EdgeAlpha',0.3,'DisplayName','截面');
    
  x_y = x0*ones(size(y));
  z_y = x0*y;
  h_tangent = plot3(x_y,y,z_y,'k','Linewidth',2,'DisplayName','切线');
  
  h_point = plot3(x0,0,0,'r.','MarkerSize',20,'DisplayName','动点');
end
  

  
  