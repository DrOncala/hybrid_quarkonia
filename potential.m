 function V=potential(name,x,mass) 
% \Sigma_g
  if strcmp(name, '\Sigma_g^+(oncala)')
  V=Vg_oncala(x,mass);
  elseif strcmp(name, '\Sigma_g^+(braaten)')
  V=Vg_braaten(x,mass);
  elseif strcmp(name, '\Sigma_g^+(lattice2111)')
  V=Vg_lattice2111(x,mass);
  elseif strcmp(name, '\Sigma_g^+(lattice1811)')
  V=Vg_lattice1811(x,mass);
%\Pi_u
  elseif strcmp(name, '\Pi_u(lattice1811)')
  V=Vp_lattice1811(x,mass);
  elseif strcmp(name, '\Pi_u(lattice2111)')
  V=Vp_lattice2111(x,mass);
  elseif strcmp(name, '\Pi_u(oncala)')
  V=Vp_oncala(x,mass);
  elseif strcmp(name, '\Pi_u(braaten)')
  V=Vp_braaten(x,mass);
%\Sigma_u
  elseif strcmp(name, '\Sigma_u^-(lattice1811)')
  V=Vs_lattice1811(x,mass);
  elseif strcmp(name, '\Sigma_u^-(lattice2111)')
  V=Vs_lattice2111(x,mass);
  elseif strcmp(name, '\Sigma_u^-(oncala)')
  V=Vs_oncala(x,mass);
  elseif strcmp(name, '\Sigma_u^-(braaten)')
  V=Vs_braaten(x,mass);
  end
 end
 
 
%%%%%%%%%%%%%%% DEFINITION OF POTENTIALS
######################################### Braaten
# Sigma_g^+ 
function V = Vg_braaten(x, mass)
  rSg = 1.80674;
  
  if mass == 1.4702
    Vfit = -0.42776;
  else
    Vfit = -0.4235;
  end
  Eo = 2 * mass + Vfit;

  % Preallocate V
  V = zeros(size(x));

  % Compute Vo for x < rSg
  idx1 = x < rSg;
  V(idx1) = 0.0052131 - 0.2403 ./ x(idx1) + 0.196746 .* (x(idx1).^2) - 0.0449234 .* (x(idx1).^4) + 0.00520945 .* (x(idx1).^6);

  % Compute Vo for x >= rSg
  idx2 = x >= rSg;
  V(idx2) = -0.0226125 + 0.467635 ./ (x(idx2).^4) + sqrt(-0.112871 + 0.0464698 .* (x(idx2).^2));

  % Add energy shift
  V = V + Eo;
end


# Pi_u
function V = Vp_braaten(x, mass)
  rPu = 3.28913;
  
  if mass == 1.4702
    Vfit = -0.42776;
  else
    Vfit = -0.4235;
  end
  Eo = 2 * mass + Vfit;

  % Preallocate V
  V = zeros(size(x));

  % Compute V for x < rPu
  idx1 = x < rPu;
  V(idx1) = 1.17768 + 0.0375 ./ x(idx1) - 0.00065453 .* (x(idx1).^2) + 0.0020068 .* (x(idx1).^4) - 0.0000792091 .* (x(idx1).^6);

  % Compute V for x >= rPu
  idx2 = x >= rPu;
  V(idx2) = -0.0224941 + 2.06921 ./ (x(idx2).^4) + sqrt(1.24141 + 0.0464564 .* (x(idx2).^2));

  % Add energy shift
  V = V + Eo;
end


# Sigma_u^- 
function V = Vs_braaten(x, mass)
  rSu = 5.61534;
  
  % Preallocate V
  V = zeros(size(x));

  % Compute V for x < rSu
  idx1 = x < rSu;
  V(idx1) = 0.0426459 .* (x(idx1).^2) - 0.00191903 .* (x(idx1).^4) + 0.0000308251 .* (x(idx1).^6) + Vp_braaten(x(idx1), mass);

  % Compute V for x >= rSu
  idx2 = x >= rSu;
  V(idx2) = - 278.151 ./ (x(idx2).^4) - sqrt(1.24141 + 0.0464564 .* (x(idx2).^2)) + sqrt(3.94993 + 0.0464564 .* (x(idx2).^2)) + Vp_braaten(x(idx2), mass);

end


######################################### oncala
# Sigma_g^+ 
function V=Vg_oncala(x,mass)
  if mass==1.4702
  Eo=2.6984;
  else
  Eo=9.5325;    
  end
  V=-0.489 ./x+0.187 .*x+Eo;  
  end
# Sigma_u^- 
function V=Vs_oncala(x,mass)
  if mass==1.4702
  Eo=3.499539;
  else
  Eo=10.333696;    
  end 
  V=0.0611 ./x+0.187 .*x+Eo;
  end
# Pi_u
function V=Vp_oncala(x,mass)
  if mass==1.4702
  Eo=3.491169;
  else
  Eo=10.325269;    
  end 
  b1=0.0696430221609656;
  b2=-1.4593432845775876;
  a1=-0.06732994686962318;
  a2=0.014330609468130364;  
  V=0.187 .*x+(0.0611 ./x).*(1.0+b1.*x+b2.*x.^2)./(1.0+a1.*x+a2.*x.^2)+Eo;
  end



######################################### 1811
# Sigma_g^+ 
function V=Vg_lattice1811(x,mass)
  Vo=0.3231652;
  if mass==1.4702
  Eo=2.487-Vo;
  elseif mass==1.628
  Eo=2.518-Vo;
  else
  Eo=9.208-Vo;    
  end
  V=-0.262623 ./x+0.216056 .*x+Eo+Vo;  
  end
# Sigma_u^-
function V=Vs_lattice1811(x,mass)
  Vo=0.3231652;
  if mass==1.4702
  Eo=2.487-Vo;
  else
  Eo=9.208-Vo;    
  end 
  A1=0.095846;
  A2=1.471779;
  A3=0.0155185;
  B1=0.1155675;
  B2=0.531993;
  B3=0.1438868;
  V=A1 ./x+A3.*x.^2+Eo+B1.*x.^2 ./(1+B2.*x+B3.*x.^2)+A2;
  end
# Pi_u
function V=Vp_lattice1811(x,mass)
  Vo=0.3231652;
  if mass==1.4702
  Eo=2.487-Vo;
  else
  Eo=9.208-Vo;   
  end 
  A1=0.095846;
  A2=1.471779;
  A3=0.0155185;
  V=A1 ./x+A3 .*x .^2+Eo+A2;
  end

######################################### 2111
# Sigma_g^+ 
function V=Vg_lattice2111(x,mass)
  Vo=0;
  if mass==1.4702
  Eo=2.517-Vo;
  elseif mass==1.628
  Eo=2.549-Vo;
  else
  Eo=9.246-Vo;    
  end
  V=-0.28958 ./x+0.210023 .*x+Eo+Vo;  
  end
# Sigma_u^-
function V=Vs_lattice2111(x,mass)
  Vo=0;
  if mass==1.4702
  Eo=2.517-Vo;
  else
  Eo=9.246-Vo;   
  end 
  A1=0.06329;
  A2=1.1358;
  A3=0.01451;
  B1=0.060795;
  B2=0.242699;
  B3=0.082539;
  V=A1 ./x+A3.*x.^2+Eo+B1.*x.^2 ./(1+B2.*x+B3.*x.^2)+A2;
  end
# Pi_u
function V=Vp_lattice2111(x,mass)
  Vo=0;
  if mass==1.4702
  Eo=2.517-Vo;
  else
  Eo=9.246-Vo;    
  end 
  A1=0.06329;
  A2=1.1358;
  A3=0.01451;
  V=A1 ./x+A3 .*x .^2+Eo+A2;
  end
