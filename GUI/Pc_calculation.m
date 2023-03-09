function Pc = Pc_calculation(Ts,Ta,D,V,delta)

g = 9.807;
rho_r = 1;

Tf = 0.5*(Ts+Ta);
vf = 1.32e-5 + 9.5e-8*Tf;
lambda_f = 2.42e-2 + 7.2e-5*Tf;

%Nu = hc*D/lambda_f; %Nusselt number
Re = rho_r*V*D/vf; %Reynolds number
Gr = D^3*(Ts-Ta)*g/((Tf+273)*vf^2); %Grashof number
Pt = 0.715-2.5e-4*Tf; %Prandtl number

if Re<=2.65e3
    B1 = 0.641;
    n= 0.471;
else 
    B1 = 0.178;
    n= 0.633;
end

Nu90 = B1*Re^n;

if delta>=0 && delta<=24
    A1 = 0.42;
    B2 = 0.68;  
    mf = 1.08; 
else
    A1 = 0.42;
    B2 = 0.58;  
    mf = 0.90; 
end

Nudelta = Nu90*(A1 + B2*(sin(delta/180*pi))^mf);

if Gr*Pt <= 1e4
    A2 = 0.850;
    m2 = 0.188;
else
    A2 = 0.480;
    m2 = 0.250;
end
Nunat = A2*(Gr*Pt)^m2;

Nu = max(Nudelta,Nunat);

Pc = pi*lambda_f*(Ts-Ta)*Nu;

end

