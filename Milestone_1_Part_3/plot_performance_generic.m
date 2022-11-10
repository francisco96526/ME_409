%% read script
% Reads in single performance files -> copy as often as you need it

files = ["performance25000.csv" "performance17500.csv" "performance10000.csv" "performance05000.csv" ...
        "performance02000.csv" "performance01500.csv" "performance01300.csv" "performance01275.csv" ...
        "performance01260.csv"];         % <- Define performance files here!
    
GWPmax = [25000 17500 10000 5000 2000 1500 1300 1275 1260];

amount = length(files);
EX_all = zeros(3,amount);
GWP_all = zeros(3,amount);

for i=1 : amount
    read_EX= readtable(files(i),...
        'Delimiter', '\t',...
        'Range', '1:4', ...
        'VariableNamingRule', 'preserve');
    read_GWP = readtable(files(i),...
        'Delimiter', '\t',...
        'Range', '6:9', ...
        'VariableNamingRule', 'preserve');

    EX_all(:,i) = table2array(read_EX(:,2));             % array of EX values
    GWP_all(:,i) = table2array(read_GWP(:,2));           % array of GWP values
    clear read_EX read_GWP;
end
clear i amount;

%% plot script

EX_names = ["CAPEX"; "OPEX"; "TOTEX"];          % Variable names
GWP_names = ["GWP_construction"; "GWP_op"; "GWP_total"];

% plotting fun yeeeehaaa
hold on;
p = plot(GWPmax, EX_all(3,:),'-o', 'MarkerSize', 5, 'LineWidth', 1);
p.Color = "#0072BD";
grid on;
title('TOTEX development for decreasing constrained max. GWP');
ax = gca;
ax.XAxis.Label.String = 'Maximal GWP [ktCO2-eq/y]';
ax.YAxis.Label.String = 'TOTEX [MCHF/y]';
ax.XAxis.Direction = 'reverse';
ticks = [25000 17500 10000 5000 1260];
ax.XAxis.TickValues = flipud(ticks.');
ax.YAxis.Exponent = 0;
ax.XAxis.Exponent = 0;
d = plot(1260, EX_all(3,9), 'o', 'MarkerSize', 5, 'MarkerFaceColor', "#0072BD");