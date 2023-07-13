% These inputs should be modified according to how much virus you want to
% label %

v_virus = 100/1000;  % initial volume of virus in mL
cm_virus = 30.0; % initial virus concentration in mg/mL

% These parameters are constants for a given virus type %
% for M13K07 use 16.4E6 g/mol and 2700 binding sites scaled by 8.7/6.4 %
% for fd use 16.4E6 g/mol and 2700 binding sites exactly %
% for M13-C7C use 10 binding sites %
% for litmus 38i use a scaling factor of 385 nm / 880 nm = 0.4375. Leads to
% litmus molecular weight = 7.18E6 g/mol and 1181 binding sites
% for miniM13 use (16.4E6 / 3 = ) 5.47E6 g/mol and (2700 / 3 = ) 900
% binding sites %

mw_virus = 16.4E6 %* 8.7/6.4;  % Molecular weight in g/mol
nsite_virus = 2700 %* 8.7/6.4; % Number of total binding sites
N_A = 6.022E23;               % Avogadro's number

% Now we use our inputs to calculate some values we need %
mass_virus = v_virus * cm_virus; % mass of virus to be labeled in mg
moles_virus = mass_virus/mw_virus * 1E-3; % moles of virus to be labeled
n_viruses = moles_virus * N_A; % number of viruses exactly
n_sites = n_viruses * nsite_virus; % number of total binding sites available

% Now for the dye %
% These numbers are for dye dissolved in 100 uL of DMSO %
% Uncomment the value of mw_dye for the specific dye you are using%
% All values of mw_dye are in g/mol %

% DyLight 550, NHS Ester %
% mw_dye = 1040;

%Alexa Fluor 488, carboxylic acid, succinimidyl ester %
%mw_dye = 643.41;

%Alexa Fluor 647, carboxylic acid, succinimidyl ester %
%mw_dye = 1273.00;

%DyLight 488, NHS Ester %
mw_dye = 1011;

% Now we need the concentration of the dye stock %
V_d = 1; % mL in dye stock
m_d = 10; % mg in dye stock
n_d = m_d/mw_dye * 1E-3; % moles of dye in stock

% Now we need to decide what percentage we want labeled, remember to adjust
% your percentage by the factor suggested by the manufacturer. Ratio should
% be a value between 0 (none labeled) and 1 (all labeled) %
fraction = 0.05;
excess = 10;
ratio = fraction * excess; %Aiming for 2% with 10 fold molar excess
vol_d = (ratio * n_sites * V_d*1000) / (n_d * N_A); % Volume of dye in uL

vol_d
