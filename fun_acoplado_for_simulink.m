function [H2_prod_T,H2_opea_P,Fun_OP_F,S_F,M_F,Xa_F,Xm_F,A_F,G_F,GA_F,N_F,Xf_F,Xe_F,Xc_F,Xh_F,IA_F,DS_F,DM_F,DXa_F,DXm_F,DA_F,DG_F,DN_F,DXf_F,DXe_F,DXc_F,DXh_F] = fun_acoplado_for_simulink(DF,DH2F)


%Programa con los parametros e instrucciones para llamar al modelo de
%simulink para obtener las superficiees de rendimiento del sistema
%acoplado.



% Programa con los parámetros del Sistema Acoplado de Celdas en unidades de
% L/d con el sistema de variables modificado. Utilizado para el programa:
% sist_acoplado_CCM_CEM_10_jul_2015_Pinto.slx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables CCM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% syms S Mox Xa Xm

% S              % Sustrato CCM [mg-S/L]
% Mox            % Mediador de oxidación de la CCM [mg-M/mg-X]
% Xa             % Bacterias Anodogenotropicas CCM [mg-Xa/L]
% Xm             % Bacterias Metanogenicas CCM [mg-Xm/L]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Variables CEM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% syms A G N Xf Xe Xc Xh

% A              % Acetato CEM [mg-A/L]
% G              % Glucosa de la CEM [mg-g/L]
% N              % Mediador de oxidación la CEM [mg-N/mg-X]
% Xf             % Bacterias Fermentativas CEM [mg-Xf/L]
% Xe             % Bacterias Electrogenicas CEM [mg-Xe/L]
% Xc             % Bacterias Metanogenicas CeM [mg-Xc/L]
% Xh             % Bacterias Hidrogenotropicas CeM [mg-Xh/L]

%hws = get_param('sist_acoplado_CCM_CEM_FOR', 'modelworkspace'); % Obtiene los parametros del modelo de simulink
hws = get_param('sist_acoplado_CCM_CEM_FOR_1', 'modelworkspace'); % Obtiene los parametros del modelo de simulink


%%%%%%%%%%%%%%%%%%%%%%%%%%% Constantes Fisicas %%%%%%%%%%%%%%%%%%%%%%%%%%%%

FV=96485;        % Constante de Faraday A s mole-1 *
F= 1.1167;       % Constante de Faraday A d mole-1 *
R=8.314472;      % Constante ideal de los gases J K-1 mol-1 *
T=300;           % Temperatura CCM K *
m=2;             % Electrons trasnferred per mol of mediator mole-1 mol(mediator)-1
gamma=663400;    % Mediator molas mass mg-M mol(mediator)-1

RH2=0.08205746;  % Constante ideal de los gases atm L K-1 mol-1 *          
RH2m=41.025;     % Constante ideal de los gases atm mL-H2 K-1 mol-1 *      
RH2m1=82.057;    % Constante ideal de los gases atm mL-H2 K-1 mol-1 *      
P=1;             % Cathode Pressure atm                                       

%%%%%%%%%%%%%%%%%%%%%%%%%% Estructurales Celdas %%%%%%%%%%%%%%%%%%%%%%%%%%%

Yx=1;
V1=5e-5;         % Volumen en metros cubicos
Asur=0.005;      % Superficie electrodo M^2
TPEM=7e-4;       % Thickness PEM
i0ref=1;         % Exchange current density for mediator oxidation A/m^2
V=0.05;          % Volumen en litros
Vcem=0.05;       % Volumen en litros

xi=gamma/(m*F*V);
xiE=gamma/(m*F*V);%

%%%%%%%%%%%%%%%%%%%%%%%%%% Parametros de la CCM %%%%%%%%%%%%%%%%%%%%%%%%%%%

Y=22.75;         % Yield mg-M mg-S-1 ------- Parametro variable *
Ych4=0.3;        % Methane Yield mL-CH4 mg-S-1

qmaxa=8.48;      % Maximum anodo RR mg-S mg-x-1 d-1
qmaxm=8.20;      % Maximum metha RR mg-S mg-x-1 d-1
mumaxa=1.97;     % Max anodo GR d-1
mumaxm=0.1;      % Max meth GR d-1
%mumaxm=0.4;     % Max meth GR d-1

Ksa=20;          % Half rate anodo mg-S L-1
Ksm=80;          % Half rate metha mg-S L-1

Mtot=0.05;       % Mediator fraction mg-M mg-x-1 ------
KM=0.01;         % Mediator half rate constant mg-M L-1

Kda=0.02*mumaxa; % Decay rate of anodo d-1
Kdm=0.02*mumaxm; % Decay rate of metha d-1

Xmaxa=512.5;     % Anodo biofilm space mg-x L-1
Xmaxm=525;       % Metha biofilm space mg-x L-1
Xmaxp=518;       % Maximum Prom

Kx=0.04;         % Parametro de alpha eq 9 L mg-x-1
Rmin=25;         % Minimum internal resistance Ohm
Rmax=400;        % Maximum internal resistance Ohm
%Rmax=250;       % Maximum internal resistance Ohm

Emin=0.01;       % Minimum EOC voltage V
Emax=0.65;       % 0.66 Maximum OCV V

KR=0.015;        % Parameter Voltage
KR1=0.0085;      % Parameter 
%KR=0.006;       % Parameter Voltage

Rint=25;         % Internal resistance
Rex=200;         % Resistencia externa

%%%%%%%%%%%%%%%%%%%%%%%%%% Parametros de la CEM %%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Yield %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Y=22.75;         % Yield mg-M mg-S-1 ------- Parametro variable *           ok
%Ych4=0.3;        % Methane Yield mL-CH4 mg-S-1 "0.28"                       ok

YM=36.6;          % Mediator Yield mg-M mg-A-1 ------- Parametro variable *  ok
Ycod=0.75;        % Yield Chemical Oxygen demand                             ok
Yh=0.75;          % Yield Hydrogen consuming 0.75 good 75 ***                ok
Yh2ch4=0.25;      % Yield methane from hydrogen                              ok
YH2=0.8;          % Cathode efficience                                       ok

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q, mu, K, Kd %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

qmaxe=14;         % Maximum electro RR mg-A mg-x-1 d-1                     ok
qmaxc=14.12;      % Maximum methano RR mg-A mg-x-1 d-1                     ok
qmaxf=16.28;      % Maximum fermenative RR mg-A mg-x-1 d-1                 ok

mumaxe=2;         % Max electro GR d-1                                     ok
mumaxc=0.1;       % Max methano GR d-1                                     ok
mumaxf=0.2;       % Max fermentative GR d-1                                ok
mumaxh=0.25;      % Max hydrogenicas GR d-1 --- 0.45 Este es el valor      ok

KN=0.01;          % Mediator half rate constant mg-M L-1                  ok
Ntot=0.05;        % Mediator fraction mg-M mg-x-1 ------  

KAe=20;           % Half rate electro mg-S L-1                             ok
KAc=80;           % Half rate methano mg-S L-1                             ok
KGf=250;          % Half rate fermentative mg-S L-1                        ok

Kde=0.04;         % Decay rate of electro d-1                              ok
Kdc=0.002;        % Decay rate of methano d-1                              ok
Kdf=0.004;        % Decay rate of fermentative d-1                         ok
Kdh=0.01;         % Decay rate of hydrogen d-1                             ok

%%%%%%%%%%%%%%%%%%%%%%%%%%% Maxima biomasa CEM %%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xmax1=800;        % Maximal attainable biomass concentration 1 mg-X L-1 "900"     ok
Xmax2=512.5;      % Maximal attainable biomass concentration 2 mg-X L-1      ok
Xmax3=650;        % Maximal attainable biomass concentration 3 mg-X L-1 --- 750 ok

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electricas CEM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

EminE=0.001;         % Minimum EOC voltage V                                  ok
EmaxE=0.2;           % 0.66 Maximum OCV CEM                                   ok

Ecef=-0.3;         % Counter electromotive force V -0.34 - -0.36 ----0.35   ok
beta=0.5;          % Redox transfer coefficient                             ok
i0=1;              % Exchange current density A m-2                         ok

RintE=100;        % Resistencia interna MEC Ohm
RminE=25;         % Minimum internal resistance Ohm
RmaxE=250;        % Maximum internal resistance Ohm

KRE=0.006;          % Parameter Voltage
KR1E=0.0085;        % Parameter 
KRH2E=0.024;        % Parameter Voltage 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Entradas CCM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Fin=0.05;        % Incoming Flow L/d
%D=Fin/V;        % Rate dilution 1/d
%D=0;            %Operando en batch
D=DF;             %Operando en continuo
Imfc_V=0.0005;   % Current
Sin=1000;         % 310-2000 mg-S L-1

%Singen=[0 2 2 15 15 22 22 30 30; 500 500 1000 1000 500 500 2000 2000 1000];
SinD=[0 ; 0];
Singen=[0 ; 0];

save signSa Singen
save signDa SinD

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Entradas MEC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FinE=0.1;         % Incoming Flow L/d 0 - 0.5 
%D=Fin/V;          % Rate dilution 1/d
DH2=DH2F;             % Rate dilution 1/d 0 - 10
Imfc=0.0005;       % Current
Imec=0.001;        % Current

Gin=500;          % 310-2000 mg-S L-1 Entrada de glucosa --> Acetato
Ain=1000;           % Entrada de Acetato mg-A L-1

Eapply=0.75;       % Voltaje aplicado

%%%%%%%%%%%%%%%%%%%%%%% Condiciones Iniciales MFC %%%%%%%%%%%%%%%%%%%%%%%%%

Xa_i=250;
Xm_i=0;
S_i=400;
Mox_i=0.001;

%%%%%%%%%%%%%%%%%%%%%% Condiciones Iniciales CEM %%%%%%%%%%%%%%%%%%%%%%%%%%

G_i=400;
A_i=400;
N_i=0.001;

Xf_i=500;
Xh_i=5;
Xc_i=0;
Xe_i=250;


lista = whos;        % Get the list of variables defined in the function
tamlis = length(lista);

for  i = 1:tamlis
      hws.assignin(lista(i).name,eval(lista(i).name));
end

%simOut = sim('sist_acoplado_CCM_CEM_FOR.slx');
simOut = sim('sist_acoplado_CCM_CEM_FOR_1.slx');
%tiempo=tiempoS.time;

%{


H2_T=H2_prod_Total.signals.values;
H2_T_F=sgolayfilt(H2_T,1,2001);
H2_prod_T=H2_T_F(end);


H2_P=H2_prod.signals.values;
H2_P_F=sgolayfilt(H2_P,1,2001);
H2_opea_P=H2_P_F(end);


S_V=sustraS.signals.values;
S_V_F=sgolayfilt(S_V,1,2001);
S_F=S_V_F(end);

M_V=mediaMox.signals.values;
M_V_F=sgolayfilt(M_V,1,2001);
M_F=M_V_F(end);

Xa_V=anodogeXa.signals.values;
Xa_V_F=sgolayfilt(Xa_V,1,2001);
Xa_F=Xa_V_F(end);

Xm_V=metanogXm.signals.values;
Xm_V_F=sgolayfilt(Xm_V,1,2001);
Xm_F=Xm_V_F(end);

A_V=AcetatoA.signals.values;
A_V_F=sgolayfilt(A_V,1,2001);
A_F=A_V_F(end);

G_V=GlucosaG.signals.values;
G_V_F=sgolayfilt(G_V,1,2001);
G_F=G_V_F(end);

GA_V=GlucoAcetGA.signals.values;
GA_V_F=sgolayfilt(GA_V,1,2001);
GA_F=GA_V_F(end);

N_V=MediadorN.signals.values;
N_V_F=sgolayfilt(N_V,1,2001);
N_F=N_V_F(end);

Xf_V=fermentaXf.signals.values;
Xf_V_F=sgolayfilt(Xf_V,1,2001);
Xf_F=Xf_V_F(end);

Xe_V=electroXe.signals.values;
Xe_V_F=sgolayfilt(Xe_V,1,2001);
Xe_F=Xe_V_F(end);

Xc_V=metanoXc.signals.values;
Xc_V_F=sgolayfilt(Xc_V,1,2001);
Xc_F=Xc_V_F(end);

Xh_V=hidrogenotroXh.signals.values;
Xh_V_F=sgolayfilt(Xh_V,1,2001);
Xh_F=Xh_V_F(end);

IA_V=corrienteIA.signals.values;
IA_V_F=sgolayfilt(IA_V,1,2001);
IA_F=IA_V_F(end);


%}

H2_T=H2_prod_Total.signals.values;
%H2_T_F=sgolayfilt(H2_T,1,2001);
H2_prod_T=H2_T(end);


H2_P=H2_prod.signals.values;
%H2_P_F=sgolayfilt(H2_P,1,2001);
H2_opea_P=H2_P(end);


Fun_OP_P=Fun_OP.signals.values;
%H2_P_F=sgolayfilt(H2_P,1,2001);
Fun_OP_F=Fun_OP_P(end);


S_V=sustraS.signals.values;
%S_V_F=sgolayfilt(S_V,1,2001);
S_F=S_V(end);

M_V=mediaMox.signals.values;
%M_V_F=sgolayfilt(M_V,1,2001);
M_F=M_V(end);

Xa_V=anodogeXa.signals.values;
%Xa_V_F=sgolayfilt(Xa_V,1,2001);
Xa_F=Xa_V(end);

Xm_V=metanogXm.signals.values;
%Xm_V_F=sgolayfilt(Xm_V,1,2001);
Xm_F=Xm_V(end);

A_V=AcetatoA.signals.values;
%A_V_F=sgolayfilt(A_V,1,2001);
A_F=A_V(end);

G_V=GlucosaG.signals.values;
%G_V_F=sgolayfilt(G_V,1,2001);
G_F=G_V(end);

GA_V=GlucoAcetGA.signals.values;
%GA_V_F=sgolayfilt(GA_V,1,2001);
GA_F=GA_V(end);

N_V=MediadorN.signals.values;
%N_V_F=sgolayfilt(N_V,1,2001);
N_F=N_V(end);

Xf_V=fermentaXf.signals.values;
%Xf_V_F=sgolayfilt(Xf_V,1,2001);
Xf_F=Xf_V(end);

Xe_V=electroXe.signals.values;
%Xe_V_F=sgolayfilt(Xe_V,1,2001);
Xe_F=Xe_V(end);

Xc_V=metanoXc.signals.values;
%Xc_V_F=sgolayfilt(Xc_V,1,2001);
Xc_F=Xc_V(end);

Xh_V=hidrogenotroXh.signals.values;
%Xh_V_F=sgolayfilt(Xh_V,1,2001);
Xh_F=Xh_V(end);

IA_V=corrienteIA.signals.values;
%IA_V_F=sgolayfilt(IA_V,1,2001);
IA_F=IA_V(end);

DS_V=DS.signals.values;
DS_F=DS_V(end);

DM_V=DM.signals.values;
DM_F=DM_V(end);

DXa_V=DXa.signals.values;
DXa_F=DXa_V(end);

DXm_V=DXm.signals.values;
DXm_F=DXm_V(end);

DA_V=DA.signals.values;
DA_F=DA_V(end);

DG_V=DG.signals.values;
DG_F=DG_V(end);

DN_V=DN.signals.values;
DN_F=DN_V(end);

DXf_V=DXf.signals.values;
DXf_F=DXf_V(end);

DXe_V=DXe.signals.values;
DXe_F=DXe_V(end);

DXc_V=DXc.signals.values;
DXc_F=DXc_V(end);

DXh_V=DXh.signals.values;
DXh_F=DXh_V(end);

%%%%%%%%%%%%%%%%%%%%%%%%%% Variables de simulink %%%%%%%%%%%%%%%%%%%%%%%%%%


%H2_prod
%tiempoS
%D_CCM
%bact_cell
%anodogeXa
%metanogXm
%sustraS
%sustraS_g
%mediaMox
%D_CEM
%corrienteIA
%GlucosaG
%AcetatoA
%AcetatoA_g
%MediadorN
%fermentaXf
%hidrogenotroXh
%metanoXc
%electroXe
%H2_prod_Total
%voltE0_CEM
%resisRin_CEM
%perdCon_CEM
%voltE0_CCM
%resisRin_CCM
%perdCon_CCM

end
