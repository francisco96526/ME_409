%% read script
% Reads in single performance files -> copy as often as you need it (need to assign new variable names!)

read_EX_1= readtable('performance.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_1 = readtable('performance.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_1_ = table2array(read_EX_1(:,2));             % array of EX values
GWP_1 = table2array(read_GWP_1(:,2));           % array of GWP values


%% plot script

EX_names = ["CAPEX"; "OPEX"; "TOTEX"];          % Variable names
GWP_names = ["GWP_construction"; "GWP_op"; "GWP_total"];

% plotting fun yeeeehaaa