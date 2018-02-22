%Programa para graficar los resultados del programa "S_D_DH2_hidro_simulink"

figure(1);

surf(DVH2,DV,H2_T)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Hidrogeno [ml-H2]','FontSize',14)
title('Producción Total de H2','FontSize',14)

figure(2);

surf(DVH2,DV,H2_P)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Hidrogeno [ml-H2/d]','FontSize',14)
title('Producción de H2 operación','FontSize',14)

figure(3);

surf(DVH2,DV,S_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Acetato [mg-S/l]','FontSize',14)
title('Concentración acetato CCM','FontSize',14)

figure(4);

surf(DVH2,DV,M_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Mediador [mg-M/mg-Xa]','FontSize',14)
title('Concentración de mediador CCM','FontSize',14)

figure(5);

surf(DVH2,DV,Xa_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Anodogenicas [mg-Xa/l]','FontSize',14)
title('Concentración bacterias anodogenicas CCM','FontSize',14)

figure(6);

surf(DVH2,DV,Xm_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Metanogenicas [mg-Xm/l]','FontSize',14)
title('Concentración bacterias metanogenicas CCM','FontSize',14)

figure(7);

surf(DVH2,DV,A_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Acetato [mg-A/l]','FontSize',14)
title('Concentración de acetato CEM','FontSize',14)


figure(8);

surf(DVH2,DV,G_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Glucosa [mg-G/l]','FontSize',14)
title('Concentración de glucosa CEM','FontSize',14)


figure(9);

surf(DVH2,DV,GA_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Acetato [mg-A/l]','FontSize',14)
title('Acetato transormado de Glucosa G->A','FontSize',14)

figure(10);

surf(DVH2,DV,N_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Mediador [mg-N/mg-Xe]','FontSize',14)
title('Concentración de mediador CEM','FontSize',14)

figure(11);

surf(DVH2,DV,Xe_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Electrógenicas [mg-Xe/l]','FontSize',14)
title('Concentración de bacterias electrogenicas CEM','FontSize',14)

figure(12);

surf(DVH2,DV,Xc_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Metanogenicas [mg-Xc/l]','FontSize',14)
title('Concentración bacterias metanogenicas CEM','FontSize',14)

figure(13);

surf(DVH2,DV,Xf_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Fermentativas [mg-Xf/l]','FontSize',14)
title('Concentración bacterias fermentativas CEM','FontSize',14)

figure(14);

surf(DVH2,DV,Xh_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Hidrogenotropicas [mg-Xh/l]','FontSize',14)
title('Concentracion bacterias hidrogenotropicas CEM','FontSize',14)


figure(15);

surf(DVH2,DV,IA_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Corriente [A]','FontSize',14)
title('Corriente electrica Sistema Acoplado','FontSize',14)


figure(16);

surf(DVH2,DV,DS_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DS','FontSize',14)
title('Derivada Sustrato','FontSize',14)

figure(17);

surf(DVH2,DV,DM_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DMox','FontSize',14)
title('Derivada Mediador','FontSize',14)

figure(18);

surf(DVH2,DV,DXa_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXa','FontSize',14)
title('Derivada Electrogenicas','FontSize',14)

figure(19);

surf(DVH2,DV,DXm_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXm','FontSize',14)
title('Derivada Metanogenicas','FontSize',14)

figure(20);

surf(DVH2,DV,DA_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DA','FontSize',14)
title('Derivada Acetato CEM','FontSize',14)

figure(21);

surf(DVH2,DV,DG_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DG','FontSize',14)
title('Derivada Glucosa','FontSize',14)

figure(22);

surf(DVH2,DV,DN_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DN','FontSize',14)
title('Derivada Nox','FontSize',14)

figure(23);

surf(DVH2,DV,DXf_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXf','FontSize',14)
title('Derivada Fermentativas','FontSize',14)

figure(24);

surf(DVH2,DV,DXe_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXe','FontSize',14)
title('Derivada Electrogenicas CEM','FontSize',14)

figure(25);

surf(DVH2,DV,DXc_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXm','FontSize',14)
title('Derivada Metanogenicas CEM','FontSize',14)

figure(26);

surf(DVH2,DV,DXh_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('DXh','FontSize',14)
title('Derivada Hidrogenotropicas','FontSize',14)

figure(27);

surf(DVH2,DV,Fun_OP_F)
colormap HSV
grid on;
xlabel('Tasa dilución CEM [1/d]','FontSize',14)
ylabel('Tasa dilución CCM [1/d]','FontSize',14)
zlabel('Yield [ml-H2/mg-A]','FontSize',14)
title('Rendimiento sistema acoplado','FontSize',14)


