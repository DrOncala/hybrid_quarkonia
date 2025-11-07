function [Energy,Y_norm,x] = quarkonium_equation(mass,L,index_n,Vname)

format long;

global global_L;
global global_mass;
global global_Vname;
global_L=L;
global_mass=mass;
global_Vname=Vname;


% DEFINE the endpoints of the integration interval:
system.a=0.001;   
system.b=22; 
% parameters of the boundary conditions:
system.A1= eye (1);
system.A2= zeros(1,1);
system.B1= eye(1);
system.B2= zeros(1,1);
% function handle to the function returning the potential matrix
system.V=@potentialMatrix;


#### COMPUTE THE EIGENVALUES FOR SEVERAL n
addpath('./source/shroedinger')

% Initialize the energies vector
[EigvData,meshData]=computeEigenvalues(system,0,index_n,5e-8);


Energy=EigvData.eigenvalues(index_n)/mass;

#### COMPUTE THE WAVE-FUNTION FOR index_n
[x,Y,YP]=computeEigenfunction(system,meshData,EigvData.eigenvalues(index_n),1);


#### NORMALIZE THE WAVE-FUNTION
norma=trapz (x,Y(1,:,1).^2); #note: trapz is integrating Y.^2 over x axes
Y_norm=Y(1,:,1)/norma^(1/2);

end


####################################################
#### POTENTIL MATRIX OF THE EQUATION
####################################################

#### DEFINE THE POTENTIL MATRIX
function pM=potentialMatrix(x) % returns the potential matrix evaluated at x
  global global_L;
  global global_mass;
  
  for i=1:4
  pM(1,1,i)=potentialTerm1(x(i),global_L,global_mass);
  end
end

#### DEFINE THE POTENTIL TERMS FOR THE MATRIX
function pT1=potentialTerm1(x,L,mass) 
  global global_Vname;
  
  pT1=(L*(L+1))/(x.^2)+mass*potential(global_Vname,x,mass);
end 
 



