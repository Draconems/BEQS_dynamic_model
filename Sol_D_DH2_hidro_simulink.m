%Programa para obtener las superficientes de rendimiento de hidrógeno del
%sistema acoplado. Este programa llama a otra funcion de matlab
%"fun_acoplado_for_simulink.m" que se encarga de llamar en cada iteración
%al archivo de simulink. Este programa no lo he utilizado pero la ultima
%ocasión funcionaba bien. 


N=65;%60;
M=N;

DVi=0.001;
DVp=DVi;
Dinc=0.015;

DVH2i=0.001;
DVH2p=DVH2i;
DVH2inc=0.015;

DV=zeros(1,N);
DVH2=zeros(1,M);

%iteracion=zeros(1,N);

H2_T=zeros(N,M);
H2_P=zeros(N,M);
Fun_OP_F=zeros(N,M);


S_F=zeros(N,M);
M_F=zeros(N,M);
Xa_F=zeros(N,M);
Xm_F=zeros(N,M);
A_F=zeros(N,M);
G_F=zeros(N,M);
GA_F=zeros(N,M);
N_F=zeros(N,M);
Xf_F=zeros(N,M);
Xe_F=zeros(N,M);
Xc_F=zeros(N,M);
Xh_F=zeros(N,M);
IA_F=zeros(N,M);
DS_F=zeros(N,M);
DM_F=zeros(N,M);
DXa_F=zeros(N,M);
DXm_F=zeros(N,M);
DA_F=zeros(N,M);
DG_F=zeros(N,M);
DN_F=zeros(N,M);
DXf_F=zeros(N,M);
DXe_F=zeros(N,M);
DXc_F=zeros(N,M);
DXh_F=zeros(N,M);


for i=1:1:N

    DV(i)=DVp;
    
    A=i;
    
    for j=1:1:M
    
    DVH2(j)=DVH2p;

    
    [H2_T(i,j),H2_P(i,j),Fun_OP_F(i,j),S_F(i,j),M_F(i,j),Xa_F(i,j),Xm_F(i,j),A_F(i,j),G_F(i,j),GA_F(i,j),N_F(i,j),Xf_F(i,j),Xe_F(i,j),Xc_F(i,j),Xh_F(i,j),IA_F(i,j),DS_F(i,j),DM_F(i,j),DXa_F(i,j),DXm_F(i,j),DA_F(i,j),DG_F(i,j),DN_F(i,j),DXf_F(i,j),DXe_F(i,j),DXc_F(i,j),DXh_F(i,j)]=fun_acoplado_for_simulink(DV(i),DVH2(j));
    
    
    DVH2p=DVH2p+DVH2inc;
    
    B=j;
    
    [A,B]
    
    end
    
    DVH2p=DVH2i;
    DVp=DVp+Dinc;

end


%{

figure(3);

surf(DV,DVH2,H2_T)
colormap HSV
grid on;
xlabel('Tasa dilución CCM [1/d]','FontSize',14)
ylabel('Tasa dilución CEM [1/d]','FontSize',14)
zlabel('Hidrogeno [ml-H2]','FontSize',14)
title('Producción Total de H2','FontSize',14)


figure(4);

surf(DV,DVH2,H2_P)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Hidrogeno [ml-H2]','FontSize',14)
title('Producción de H2 operación','FontSize',14)

%}



