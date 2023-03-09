function PJ = PJ_calculation(Idc,Rdc,alpha,Ts)

PJ = Idc^2*Rdc*(1+alpha*(Ts-20));

end

