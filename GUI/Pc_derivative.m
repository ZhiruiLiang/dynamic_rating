function Pc_1d = Pc_derivative(Ts,Ta,D,V,delta)
syms Tss

rho_r = 1;
Tf = 0.5*(Ts+Ta);
vf = 1.32e-5 + 9.5e-8*Tf;
lambda_f = 2.42e-2 + 7.2e-5*Tf;

Re = rho_r*V*D/vf;
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

Nu = Nu90*(A1 + B2*(sin(delta/180*pi))^mf);
Pcc(Tss) = pi*lambda_f*(Tss-Ta)*Nu;
Pc_1d(Tss) = diff(Pcc(Tss));

end

