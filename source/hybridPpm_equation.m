function [Energy,Y1_norm,Y2_norm,x] = hybridPpm_equation(mass,J,index_n,Vname_S,Vname_P)
%disp('**************************************************')
%disp('Hybrid coupled P^+ / P^-:')
%disp('**************************************************')
format long;

global global_J
global global_mass
global global_Vname_S
global global_Vname_P
global_J=J;
global_mass=mass;
global_Vname_S=Vname_S;
global_Vname_P=Vname_P;
%disp('**************************************************')


% DEFINE the endpoints of the integration interval:
system.a=0.001;   
system.b=22; 
% parameters of the boundary conditions:
system.A1= eye (2);
system.A2= zeros(2,2);
system.B1= eye(2);
system.B2= zeros(2,2);
% function handle to the function returning the potential matrix
system.V=@potentialMatrix;



#### COMPUTE THE EIGENVALUES FOR SEVERAL n
addpath('./source/shroedinger')

[EigvData,meshData]=computeEigenvalues(system,0,index_n,5e-8);




#### COMPUTE THE EIGENVALUES FOR index_n
Energy=EigvData.eigenvalues(index_n)/mass;

#### COMPUTE THE WAVE-FUNTION FOR index_n
[x,Y,YP]=computeEigenfunction(system,meshData,EigvData.eigenvalues(index_n),1);


#### NORMALIZE THE WAVE-FUNTION
norma=trapz (x,Y(1,:,1).^2+Y(2,:,1).^2); #note: trapz is integrating Y.^2 over x axes
Y1_norm=Y(1,:,1)/norma^(1/2);
Y2_norm=Y(2,:,1)/norma^(1/2);

end


####################################################
#### POTENTIL MATRIX OF THE EQUATION
####################################################

#### DEFINE THE POTENTIL MATRIX
function pM=potentialMatrix(x) % returns the potential matrix evaluated at x
  global global_J
  global global_mass
  
  for i=1:4 
  pM(1,1,i)=potentialTerm11(x(i),global_J,global_mass);
  pM(1,2,i)=potentialTerm12(x(i),global_J,global_mass);
  pM(2,1,i)=potentialTerm21(x(i),global_J,global_mass);
  pM(2,2,i)=potentialTerm22(x(i),global_J,global_mass);
  end

end

#### DEFINE THE POTENTIL TERMS FOR THE MATRIX
function pT=potentialTerm11(x,J,mass) 
  global global_Vname_S
  global global_Vname_P
  A=(J-1)*J ./(x.^2);
  B=mass*potential(global_Vname_S,x,mass);
  Vq=potential(global_Vname_P,x,mass)-potential(global_Vname_S,x,mass);
  C=mass*Vq*(J+1)/(2*J+1);
  pT=A+B+C;
end 

function pT=potentialTerm12(x,J,mass) 
  global global_Vname_S
  global global_Vname_P
  A=0;
  B=0;
  Vq=potential(global_Vname_P,x,mass)-potential(global_Vname_S,x,mass);
  C=mass*Vq*sqrt((J+1)*J)/(2*J+1);
  pT=A+B+C;
end 

function pT=potentialTerm21(x,J,mass) 
  global global_Vname_S
  global global_Vname_P
  A=0;
  B=0;
  Vq=potential(global_Vname_P,x,mass)-potential(global_Vname_S,x,mass);
  C=mass*Vq*sqrt((J+1)*J)/(2*J+1);
  pT=A+B+C;
end 

function pT=potentialTerm22(x,J,mass) 
  global global_Vname_S
  global global_Vname_P
  A=(J+1)*(J+2) ./(x.^2);
  B=mass*potential(global_Vname_S,x,mass);
  Vq=potential(global_Vname_P,x,mass)-potential(global_Vname_S,x,mass);
  C=mass*Vq*J/(2*J+1);
  pT=A+B+C;
end 


