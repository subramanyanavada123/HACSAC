function u0 = IC(x,ICcase)
% Create vector u0 with an Initial Condition. 6 cases are available.
%**************************************************************************
%
% 4 cases available: 
% {1} Gaussian wave
% {2} Simusoidal wave
% {3} Centered Sinusoidal wave
% {4} Riemann IC
% {5} HyperTangent
% {6} Square Jump
%
% Coded by Manuel Diaz 2012.12.06
%**************************************************************************

% Create the selected IC
switch ICcase
    case 1 % Gaussian wave
        xmid = (x(end)-x(1))/2;
        u0 = exp(-(2*(x-xmid)).^2);
        
    case 2 % sinusoidal wave
        u0 = 0.5 + sin(x);
        
    case 3 % centered sinusoidal wave
        u0 = sin(x);
        
    case 4 % Riemann problem
             % u = 1 for x <  x_mid
             % u = 0 for x >= x_mid
        u0 = ones(size(x));
        xmid = (x(end)-x(1))/2;
        rhs = find(x<=xmid);
        u0(rhs) = 0.1;
    
    case 5 % Tanh
        a = x(1); b = x(end);
        xi = (4-(-4))/(b-a)*(x - a) - 4;
        u0 = 1/2*(tanh(-4*xi)+1);
        
    case 6 % Square Jump
        u0 = ones(size(x));
        x1 = (x(end)-x(1))*2/5;
        x2 = (x(end)-x(1))*3/5;
        rhs = find(x>=x1 & x<=x2);
        u0(rhs) = 2;
        
    otherwise
        error('case not in the list')
end
