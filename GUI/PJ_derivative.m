function PJ_1d = PJ_derivative(Idc,Rdc,alpha)
syms Tss
PJJ(Tss) = Idc^2*Rdc*(1+alpha*(Tss-20));
PJ_1d = diff(PJJ(Tss));
end

