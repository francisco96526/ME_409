%% read script
% Reads in single performance files -> copy as often as you need it



files = ["performance_001.csv" "performance_002.csv" "performance_003.csv" "performance_004.csv" "performance_005.csv" "performance_006.csv" "performance_007.csv" "performance_008.csv" "performance_010.csv" "performance_012.csv"];         % <- Define performance files here!

amount = length(files);
EX_all = zeros(3,amount);
GWP_all = zeros(3,amount);

for i=1 : amount
    read_EX = readtable(files(i),...
        'Delimiter', '\t',...
        'Range', '1:4', ...
        'VariableNamingRule', 'preserve');
    read_GWP = readtable(files(i),...
        'Delimiter', '\t',...
        'Range', '6:9', ...
        'VariableNamingRule', 'preserve');

    EX_all(:,i) = table2array(read_EX(:,2));             % matrix of EX values
    GWP_all(:,i) = table2array(read_GWP(:,2));           % matrix of GWP values
    clear read_EX read_GWP;
end
clear i amount;

%% plot script

EX_names = ["CAPEX"; "OPEX"; "TOTEX"];          % Variable names
GWP_names = ["GWP construction"; "GWP op"; "GWP total"];
price = [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.10 0.12]


%%

% plot grouped
figure(1);
p1 = plot(price, EX_all.', '-o', 'MarkerSize', 4, 'LineWidth', 1);
p1(1).Color = "#EDB120";
p1(2).Color = "#D95319";
p1(3).Color = "#0072BD";
legend(EX_names);
xlabel('Price [CHF/kWh]');
ylabel('Value [MCHF/y]');
title('Expenditure development for varying NG price');
xlim([0.005,0.125])
grid on;
drawnow;

figure(2);
p2 = plot(price, GWP_all.', '-o', 'MarkerSize', 4, 'LineWidth', 1);
p2(1).Color = "#EDB120";
p2(2).Color = "#D95319";
p2(3).Color = "#0072BD";
legend(GWP_names);
xlabel('Price [CHF/kWh]');
ylabel('Value [ktCO2-eq/y]');
title('GWP development for varying NG price');
xlim([0.005,0.125])
grid on;
drawnow;
