clc
close all
%% bouncing ball
figure,
plot(out.simout,'linewidth',2)
p_y=ylabel('Height');
set(p_y,'Color','k','fontsize',15,'Fontweight','b'); 
p_x=xlabel('Time(s)');
set(p_x,'Color','k','fontsize',15,'Fontweight','b');
p_title=title('Height Trajectory');
set(p_title,'Color','k','fontsize',15,'Fontweight','b');
grid on 
%
figure,
plot(out.simout1,'linewidth',2)
p_y=ylabel('Velocity');
set(p_y,'Color','k','fontsize',15,'Fontweight','b'); 
p_x=xlabel('Time(s)');
set(p_x,'Color','k','fontsize',15,'Fontweight','b');
p_title=title('Velocity Trajectory');
set(p_title,'Color','k','fontsize',15,'Fontweight','b');
grid on 
%% two tanks:
figure,
plot(out.simout,'linewidth',2)
p_y=ylabel('Tank 1 Level');
set(p_y,'Color','k','fontsize',15,'Fontweight','b'); 
p_x=xlabel('Time(s)');
set(p_x,'Color','k','fontsize',15,'Fontweight','b');
p_title=title('Tank 1 Level Trajectory');
set(p_title,'Color','k','fontsize',15,'Fontweight','b');
grid on 
%
figure,
plot(out.simout1,'linewidth',2)
p_y=ylabel('Tank 2 Level');
set(p_y,'Color','k','fontsize',15,'Fontweight','b'); 
p_x=xlabel('Time(s)');
set(p_x,'Color','k','fontsize',15,'Fontweight','b');
p_title=title('Tank 2 Level Trajectory');
set(p_title,'Color','k','fontsize',15,'Fontweight','b');
grid on 
%
figure,
plot(out.simout2,'linewidth',2)
p_y=ylabel('Active State');
set(p_y,'Color','k','fontsize',15,'Fontweight','b'); 
p_x=xlabel('Time(s)');
set(p_x,'Color','k','fontsize',15,'Fontweight','b');
p_title=title('State Trajectory');
set(p_title,'Color','k','fontsize',15,'Fontweight','b');
grid on 