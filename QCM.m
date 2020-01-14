% 
% 1/C_total = 1/C_quantum + 1/C_edl
% 
% @XiaonaZhao
% nonazhao2016@gmail.com


e = 1.602176634*(10^(-19)); % the elementary charge, Unit: C = A*s
k_B = 1.38064852*(10^(-23)); % the boltzmann constant, Unit: m2*kg*s-2 K-1
T = 298; % the temperature, Unit: K
h_bar = 1.054571817*(10^(-34)); % the reduced Planck constant, Unit: m2*kg/s = J*s
c = 299792458; % the velocity of light, Unit: m/s
eV = 1.602176634*10^(-19); % J = kg*m2*s-2

%%
% C_quantum of Graphene
v_F = c/300; % the Fermi velocity of the Dirac electron, Unit: m/s
% V = E_F/e; % the potential of graphene

V_ch = (-1:0.01:1)'; % Unit: V = ?kg*m2*s-3*A-1

C_Q = 2*e^2*k_B*T./(pi*(h_bar*v_F)^2)*log(2*(1+cosh(e*V_ch./(k_B*T))));

figure('color', 'w');
plot(V_ch, C_Q)

legend('Graphene')
xlabel('V_c_h (V)')
ylabel('C_q (\muF/cm^2)')
set(findobj(get(gca, 'Children'), 'LineWidth',0.5), 'LineWidth', 2);
set(gca, 'linewidth', 1.5)

%%
% C_quantum of MoS2

% g_2D = g_s*g_v*m_star/(2*pi*h_bar^2); % Band-edge density of states
g_2D = 4.33*(10^14)*(10^4)/eV; % Unit: m-2/J = m-4*kg-1*s2
E_G = 1.9*eV; % J = kg*m2*s-2
C_Q = e^2*g_2D*(1+exp(E_G/(2*k_B*T)./(2*cosh(e*V_ch./(k_B*T))))).^(-1);

figure('color', 'w');
plot(V_ch, C_Q)

legend('MoS_2')
xlabel('V_c_h (V)')
ylabel('C_q (\muF/cm^2)')
set(findobj(get(gca, 'Children'), 'LineWidth',0.5), 'LineWidth', 2);
set(gca, 'linewidth', 1.5)
