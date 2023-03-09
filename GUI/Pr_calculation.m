function Pr = Pr_calculation(Ts,Ta,D,epsilon,theta_B)

Pr = pi*D*epsilon*theta_B*((Ts+273)^4-(Ta+273)^4);

end
