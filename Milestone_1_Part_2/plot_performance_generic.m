%% read script
% Reads in single performance files -> copy as often as you need it (need to assign new variable names!)


% Read in performance0_01
file = 'performance0_01.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_01 = table2array(read_EX(:,2));             % array of EX values
GWP0_01 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_02
file = 'performance0_02.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_02 = table2array(read_EX(:,2));             % array of EX values
GWP0_02 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_04
file = 'performance0_04.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_04 = table2array(read_EX(:,2));             % array of EX values
GWP0_04 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_08
file = 'performance0_08.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_08 = table2array(read_EX(:,2));             % array of EX values
GWP0_08 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_10
file = 'performance0_10.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_10 = table2array(read_EX(:,2));             % array of EX values
GWP0_10 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_12
file = 'performance0_12.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_12 = table2array(read_EX(:,2));             % array of EX values
GWP0_12 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_15
file = 'performance0_15.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_15 = table2array(read_EX(:,2));             % array of EX values
GWP0_15 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_20
file = 'performance0_20.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_20 = table2array(read_EX(:,2));             % array of EX values
GWP0_20 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;


% Read in performance0_50
file = 'performance0_50.csv';% <- Define performance file here

read_EX= readtable(file,...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP = readtable(file,...
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX0_50 = table2array(read_EX(:,2));             % array of EX values
GWP0_50 = table2array(read_GWP(:,2));           % array of GWP values

clear file read_EX read_GWP;
%% plot script

EX_names = ["CAPEX"; "OPEX"; "TOTEX"];          % Variable names
GWP_names = ["GWP construction"; "GWP op"; "GWP total"];

EX_all = [EX0_01 EX0_02 EX0_04 EX0_08 EX0_10 EX0_12 EX0_15 EX0_20 EX0_50];
GWP_all = [GWP0_01 GWP0_02 GWP0_04 GWP0_08 GWP0_10 GWP0_12 GWP0_15 GWP0_20 GWP0_50];
price = [0.01 0.02 0.04 0.08 0.10 0.12 0.15 0.20 0.50];     % [CHF/kWh]

% plotting fun yeeeehaaa

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
grid on;
drawnow;