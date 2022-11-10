%% read script
% Reads in single performance files -> copy as often as you need it (need to assign new variable names!)

% Read fossil
read_EX_fossil= readtable('performance_fossil.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_fossil = readtable('performance_fossil.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_fossil = table2array(read_EX_fossil(:,2));             % array of EX values
GWP_fossil = table2array(read_GWP_fossil(:,2));           % array of GWP values

clear read_EX_fossil;
clear read_GWP_fossil;


% Read fossil_nuclear
read_EX_fossil_nuclear= readtable('performance_fossil_nuclear.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_fossil_nuclear = readtable('performance_fossil_nuclear.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_fossil_nuclear = table2array(read_EX_fossil_nuclear(:,2));             % array of EX values
GWP_fossil_nuclear = table2array(read_GWP_fossil_nuclear(:,2));           % array of GWP values

clear read_EX_fossil_nuclear;
clear read_GWP_fossil_nuclear;


% Read fossil_renewable
read_EX_fossil_renewable= readtable('performance_fossil_renewable.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_fossil_renewable = readtable('performance_fossil_renewable.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_fossil_renewable = table2array(read_EX_fossil_renewable(:,2));             % array of EX values
GWP_fossil_renewable = table2array(read_GWP_fossil_renewable(:,2));           % array of GWP values

clear read_EX_fossil_renewable;
clear read_GWP_fossil_renewable;


% Create renewable_nuclear (since it was unsolvable, there is no data to read in)
EX_renewable_nuclear = NaN(3, 1);
GWP_renewable_nuclear = NaN(3, 1);

% Read gas_renewable_nuclear
read_EX_gas_renewable_nuclear= readtable('performance_gas_renewable_nuclear.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_gas_renewable_nuclear = readtable('performance_gas_renewable_nuclear.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_gas_renewable_nuclear = table2array(read_EX_gas_renewable_nuclear(:,2));             % array of EX values
GWP_gas_renewable_nuclear = table2array(read_GWP_gas_renewable_nuclear(:,2));           % array of GWP values

clear read_EX_gas_renewable_nuclear;
clear read_GWP_gas_renewable_nuclear;

% Read fossile_renewable_nuclear
read_EX_fossil_renewable_nuclear= readtable('performance_fossil_renewable_nuclear.csv',...     % <- Define performance file here...
    'Delimiter', '\t',...
    'Range', '1:4', ...
    'VariableNamingRule', 'preserve');
read_GWP_fossil_renewable_nuclear = readtable('performance_fossil_renewable_nuclear.csv',...    % <- ...and here!
    'Delimiter', '\t',...
    'Range', '6:9', ...
    'VariableNamingRule', 'preserve');

EX_fossil_renewable_nuclear = table2array(read_EX_fossil_renewable_nuclear(:,2));             % array of EX values
GWP_fossil_renewable_nuclear = table2array(read_GWP_fossil_renewable_nuclear(:,2));           % array of GWP values

clear read_EX_fossil_renewable_nuclear;
clear read_GWP_fossil_renewable_nuclear;

%% plot script

EX_names = ["CAPEX" "OPEX" "TOTEX"];          % Variable names
GWP_names = ["GWP construction" "GWP op" "GWP total"];

models = categorical(["Fossil", "Fossil + Nuclear", "Fossil + Renewables", "Renewables + Nuclear", "Fossile + Renewables + Nuclear", "Gas + Renewables + Nuclear"]);
models = reordercats(models,["Fossil", "Fossil + Nuclear", "Fossil + Renewables", "Renewables + Nuclear", "Fossile + Renewables + Nuclear", "Gas + Renewables + Nuclear"]);
% models = ["Fossil" "Fossil+Nuclear" "Fossil+Renewable" "Renewable+Nuclear" "Fossile+Renewables+Nuclear"];

all_EX = [EX_fossil EX_fossil_nuclear EX_fossil_renewable EX_renewable_nuclear EX_fossil_renewable_nuclear EX_gas_renewable_nuclear];
all_GWP = [GWP_fossil GWP_fossil_nuclear GWP_fossil_renewable GWP_renewable_nuclear GWP_fossil_renewable_nuclear GWP_gas_renewable_nuclear];


% plotting fun yeeeehaaa

%{
% plot ungrouped
for i=1 : 3
    figure(i);
    bar(models, all_EX(i, :), 0.3);
    title(EX_names(i));
    ylabel('Value [MCHF/y]');
    drawnow;
end

for i=1 : 3
    figure(i+3);
    bar(models, all_GWP(i, :), 0.3);
    title(GWP_names(i));
    ylabel('Value [ktCO2-eq/y]');
    drawnow;
end
clear i;
%}

% plot grouped
figure(1);
b1 = bar(models, all_EX);
b1(1).FaceColor = "#EDB120";
b1(2).FaceColor = "#D95319";
b1(3).FaceColor = "#0072BD";
legend(EX_names);
ylabel('Value [MCHF/y]');
title('Expenditure performance');
grid on;
drawnow;

figure(2);
b2 = bar(models, all_GWP);
b2(1).FaceColor = "#EDB120";
b2(2).FaceColor = "#D95319";
b2(3).FaceColor = "#0072BD";
legend(GWP_names);
ylabel('Value [ktCO2-eq/y]');
title('Global warming potential performance');
grid on;
drawnow;
