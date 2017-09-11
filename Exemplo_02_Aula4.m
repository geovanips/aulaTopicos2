
N=200;
n=2;%na=nb=2
y=zeros(1,N);
u=ones(1,N);u(1)=0;%entrada degrau
%u = idinput(N,'prbs',[0,0.1])';%Entrada randomica
a1=-0.7889;
a2=0.01832;
b0=0.4443;
b1=0.1292;
X=[];
Y=[];
%d=0;

for k=n+1:N
    
    y(k)= -a1*y(k-1)-a2*y(k-2)+b0*u(k-1)+b1*u(k-2);%equação a diferenças.
    
    %X=[X;-y(k-1) -y(k-2) u(k-d-1) u(k-d-2)];%montar a matriz de regressores. Modelo ARX
    X=[X;-y(k-1) -y(k-2) u(k-1) u(k-2)];%montar a matriz de regressores. Modelo ARX
    Y=[Y;y(k)];%Montar o vetor de saída
    
end

plot(y);grid;