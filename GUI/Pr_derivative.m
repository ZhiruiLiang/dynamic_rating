function Pr_1d = Pr_derivative(Ta,D,epsilon,theta_B)
syms Tss
Prr(Tss) = pi*D*epsilon*theta_B*((Tss+273)^4-(Ta+273)^4);
Pr_1d(Tss) = diff(Prr(Tss));
end
