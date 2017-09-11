clc;
N=200;
n=2;%na=nb=2
y=zeros(1,N);
u=ones(1,N);%entrada degrau
%u = idinput(N,'prbs',[0,0.1])';
u(1)=0;
a1=-0.7889;
a2=0.01832;
b0=0.4443;
b1=0.1292;
X=[];
Y=[];
d=1;

for k=n+1:N
    
    y(k)= -a1*y(k-d)-a2*y(k-d-1)+b0*u(k-d)+b1*u(k-d-1);%Lê os dados da saída
    %X=[X;-y(k-1) u(k-1)];
    X=[X;-y(k-1) -y(k-2) u(k-1) u(k-2)]; %monta os regressores
    Y=[Y;y(k)]; %monta o vetor de saída
    
    
end
Theta = (X'*X)^-1*X'*Y
a1=Theta(1);
a2=Theta(2);
b0=Theta(3);
b1=Theta(4);
yest=zeros(1,N);
for k=n+1:N
    yest(k)=a1*yest(k-d)-a2*yest(k-d-1)+b0*u(k-d)+b1*u(k-d-1);%2Ordem
    %yest(k)=-a1*yest(k-d)+b0*u(k-d) 1º Ordem
end
subplot(2,1,1)
plot(y,'b*-');grid;title('Saída do sistema Y(k)´s');
subplot(2,1,2)
plot(u,'r.-');grid;title('Sinal de entrada U(k)´s');







