function [K,Tau,D]=metodoSmith(y,u,tempo)

dy = y(end)-y(1);% delta Y
du = u(end)-u(1);% delta U

K = dy/du; %Ganho estático

yt1 = y(1)+(dy)*0.283; %ponto que representa 28.3% do valor de Yss
yt2 = y(1)+(dy)*0.632; %ponto que representa 63.2% do valor de Yss

t1=0;
t2=0;
i=1;

%Loop para encontrar tempo 1
while (y(i)<yt1)
   t1=tempo(i); 
   i=i+1; 
end
i=1;
%Loop para encontrar tempo 2
while (y(i)<yt2)
   t2=tempo(i); 
   i=i+1; 
end

%Fórmula de Smith
Tau = 1.5*(t2-t1); %constante de tempo
D = t2-Tau;        %atraso de transporte


end