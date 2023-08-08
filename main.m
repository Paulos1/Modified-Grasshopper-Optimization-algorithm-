% To run CGOA with crossover: [Best_score,Best_pos,GOA_cg_curve]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)

clear all 
clc

SearchAgents_no=30; % Number of search agents

Function_name='F2'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[cTarget_score,cTarget_pos,cGOA_cg_curve, cTrajectories,cfitness_history, cposition_history]=CGOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

[Target_score,Target_pos,GOA_cg_curve, Trajectories,fitness_history, position_history]=GOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

 figure('Position',[454   445   894   297])
% %Draw search space
% subplot(1,5,1);
% func_plot(Function_name);
% title('Parameter space')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([Function_name,'( x_1 , x_2 )'])
% box on
% axis tight
% 
% subplot(1,5,2);
% hold on
% for k1 = 1: size(cposition_history,1)
%     for k2 = 1: size(cposition_history,2)
%         plot(cposition_history(k1,k2,1),cposition_history(k1,k2,2),'.','markersize',1,'MarkerEdgeColor','k','markerfacecolor','k');
%     end
% end
% plot(cTarget_pos(1),cTarget_pos(2),'.','markersize',10,'MarkerEdgeColor','r','markerfacecolor','r');
% title('Search history (x1 and x2 only)')
% xlabel('x1')
% ylabel('x2')
% box on
% axis tight
% 
% subplot(1,5,3);
% hold on
% plot(cTrajectories(1,:));
% title('Trajectory of 1st grasshopper')
% xlabel('Iteration#')
% box on
% axis tight
% 
% subplot(1,5,4);
% hold on
% plot(mean(fitness_history),'k');
% hold on
% plot(mean(cfitness_history),'r');
% title('Average fitness of all grasshoppers')
% xlabel('Iteration#')
% legend('GOA','C-GOA')
% box on
% axis tight

%Draw objective space
%subplot(1,5,5);
semilogy(GOA_cg_curve,'k')
hold on
semilogy(cGOA_cg_curve,'r')
title('Convergence curve')
xlabel('Iteration#');
ylabel([Function_name,' Best score obtained']);
legend('GOA','PM-GOA')
box on
axis tight
%set(gcf, 'position' , [39         479        1727         267]);


display(['The best solution obtained by CGOA is : ', num2str(cTarget_pos)]);
display(['The best optimal value of the objective funciton found by CGOA is : ', num2str(cTarget_score)]);
display(['The best solution obtained by GOA is : ', num2str(Target_pos)]);
display(['The best optimal value of the objective funciton found by GOA is : ', num2str(Target_score)]);
