%% read script
% Reads in single performance files -> copy as often as you need it

files = ["performance25000.csv" "performance17500.csv" "performance10000.csv" "performance05000.csv" ...
        "performance02000.csv" "performance01500.csv" "performance01300.csv" "performance01275.csv" ...
        "performance01260.csv"];         % <- Define performance files here!

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