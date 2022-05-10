if draw_domain.enable == false
    return;
end

disp('drawing objects');

f=figure;

grid on;


%% display circles
for i=1:number_of_circles

    [X, Y, Z] = cylinder(1,144);
    X = X * circles(i).radius; 
    Y = Y * circles(i).radius; 
    X = X + circles(i).center_x; 
    Y = Y + circles(i).center_y; 
    RGB = material_types(circles(i).material_type).color;
    v = [X(1,:).' Y(1,:).'];
    patch('vertices',v,'faces',[1:145], ...
        'FaceColor',RGB, 'EdgeColor','k');
end
hold on;
%%
% display rings

    [X, Y, Z] = cylinder(1,144);
    steps = 145;
    theta = 0:2*pi/steps:2*pi;
    r_outer = ones(size(theta))*outerRadius;
    r_inner = ones(size(theta))*innerRadius;
    rr = [r_outer;r_inner];
    theta = [theta;theta];
    xx = rr.*cos(theta);
    yy = rr.*sin(theta);
    zz = zeros(size(xx));
   RGB = material_types(circles(i).material_type).color;
 surf(xx,yy,zz)
    patch('vertices',v,'faces',[1:145], ...
        'FaceColor',RGB, 'EdgeColor','k');
    hold on;

%%
    [X, Y, Z] = cylinder(1,144);
    steps = 145;
    theta2 = 0:2*pi/steps:2*pi;
    r_outer2 = ones(size(theta2))*outerRadius2;
    r_inner2 = ones(size(theta2))*innerRadius2;
    rr2 = [r_outer2;r_inner2];
    theta2 = [theta2;theta2];
    xx2 = rr2.*cos(theta2);
    yy2 = rr2.*sin(theta2);
    zz2 = zeros(size(xx2));
   RGB = material_types(circles(i).material_type).color;
    surf(xx2,yy2,zz2)
    hold on

% % display bricks
vertices=[0 0;1 0;1 1;0 1];
faces=[1 2 3 4];
for i=1:number_of_rectangles
    lx = rectangles(i).min_x;
    ux = rectangles(i).max_x;
    ly = rectangles(i).min_y;
    uy = rectangles(i).max_y;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    RGB = material_types(rectangles(i).material_type).color;
    patch('Vertices',v,'Faces',faces,...
        'FaceColor',RGB ,'EdgeColor','k');
end

% display impressed J
for i=1:number_of_impressed_J
    lx = impressed_J(i).min_x;
    ux = impressed_J(i).max_x;
    ly = impressed_J(i).min_y;
    uy = impressed_J(i).max_y;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    RGB = [0 0 1];
    patch('Vertices',v,'Faces',faces,...
        'FaceColor','none' , 'EdgeColor',RGB,'linewidth',2);
    text(ux,uy,[' J_' num2str(i)],'fontsize',12);
end

% display impressed M
for i=1:number_of_impressed_M
    lx = impressed_M(i).min_x;
    ux = impressed_M(i).max_x;
    ly = impressed_M(i).min_y;
    uy = impressed_M(i).max_y;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    RGB = [0 1 0];
    patch('Vertices',v,'Faces',faces,...
        'FaceColor','none' , 'EdgeColor',RGB,'linewidth',2);
    text(ux,uy,[' M_' num2str(i)],'fontsize',12);
end

% display sampled electric field
for i=1:number_of_sampled_electric_fields
    x = sampled_electric_fields(i).x;
    y = sampled_electric_fields(i).y;
    line([x x],[y y],'marker','x','MarkeredgeColor','r');
    text(x,y,[' E_' num2str(i)],'fontsize',12);
end

% display sampled magnetic field
for i=1:number_of_sampled_magnetic_fields
    x = sampled_magnetic_fields(i).x;
    y = sampled_magnetic_fields(i).y;
    line([x x],[y y],'marker','o','MarkeredgeColor','r');
    text(x,y,[' H_' num2str(i)],'fontsize',12);
end

 dlx = fdtd_domain.min_x;
 dly = fdtd_domain.min_y;
 dux = fdtd_domain.max_x;
 duy = fdtd_domain.max_y;
 
% draw pml regions
pml_RGB = [1 0.8 0.6];fa=0.5;
if is_pml_xn
    lx = dlx;    ux = dlx + n_pml_xn * dx;
    ly = dly;    uy = dly + ny * dy;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    patch('Vertices',v,'Faces',faces,...
          'FaceColor',pml_RGB,'facealpha',fa);
end
if is_pml_xp
    lx = dux - n_pml_xp * dx;    ux = dux;
    ly = dly;    uy = dly + ny * dy;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    patch('Vertices',v,'Faces',faces,...
          'FaceColor',pml_RGB,'facealpha',fa);
end
if is_pml_yn
    lx = dlx;    ux = dlx + nx * dx;
    ly = dly;    uy = dly + n_pml_yn * dy;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    patch('Vertices',v,'Faces',faces,...
          'FaceColor',pml_RGB,'facealpha',fa);
end
if is_pml_yp
    lx = dlx;    ux = dlx + nx * dx;
    ly = duy - n_pml_yp * dy;    uy = duy;
    v = vertices;
    v(:,1) = v(:,1) * (ux - lx) + lx;
    v(:,2) = v(:,2) * (uy - ly) + ly;
    patch('Vertices',v,'Faces',faces,...
          'FaceColor',pml_RGB,'facealpha',fa);
end

% draw grid
if draw_domain.draw_grid
    cl = [0.2 0.2 0.2];
    for mj=0:ny
         line([dlx dux],[dly+mj*dy dly+mj*dy],'color',cl,'linewidth',0.5);
    end
    for mi=0:nx
         line([dlx+mi*dx dlx+mi*dx], [dly duy],'color',cl,'linewidth',0.5);
    end
end

% draw axis
if draw_domain.draw_axis
    line([0 3*dx],[0 0],'color','b','linewidth',2);
    line([2*dx 3*dx],[0.5*dy 0],'color','b','linewidth',2);
    line([2*dx 3*dx],[-0.5*dy 0],'color','b','linewidth',2);
    text (3*dx,0,'x','fontsize',12,'fontweight','demi');
    line([0 0],[0 3*dy],'color','b','linewidth',2);
    line([0.5*dx 0],[2*dy 3*dy],'color','b','linewidth',2);
    line([-0.5*dx 0],[2*dy 3*dy],'color','b','linewidth',2);
    text (0,3.5*dy,'y','fontsize',12,'fontweight','demi');
end

 % draw computational space boundaries
line([dlx dux],[dly dly],'color','r','linewidth',2);
line([dlx dux],[duy duy],'color','r','linewidth',2);
line([dlx dlx],[dly duy],'color','r','linewidth',2);
line([dux dux],[dly duy],'color','r','linewidth',2);

axis equal;
% axis off;

 