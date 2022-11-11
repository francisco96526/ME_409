%% read script
% Reads in single performance files -> copy as often as you need it



files = ["performance_Fos.csv" "performance_FosNuc.csv" "performance_FosRen.csv" "performance_RenNuc.csv" "performance_FosRenNuc.csv"];         % <- Define performance files here!

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


%%

% plotting fun yeeeehaaa

models = categorical(["Fossil", "Fossil + Nuclear", "Fossil + Renewables", "Renewables + Nuclear", "Fossile + Renewables + Nuclear"]);
models = reordercats(models,["Fossil", "Fossil + Nuclear", "Fossil + Renewables", "Renewables + Nuclear", "Fossile + Renewables + Nuclear"]);

%%
% plot grouped
figure(1);
b1 = bar(models, EX_all);
b1(1).FaceColor = "#EDB120";
b1(2).FaceColor = "#D95319";
b1(3).FaceColor = "#0072BD";
legend(EX_names);
ylabel('[MCHF/y]');
title('Expenditure performance');
grid on;
drawnow;

%%
figure(2);
b2 = bar(models, GWP_all);
b2(1).FaceColor = "#EDB120";
b2(2).FaceColor = "#D95319";
b2(3).FaceColor = "#0072BD";
legend(GWP_names);
ylabel('[ktCO2-eq/y]');
title('Global warming potential performance');
grid on;
drawnow;