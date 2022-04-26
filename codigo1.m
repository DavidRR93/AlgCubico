% ===== C Ó D I G O    D E S A R R O L L A D O   E N   S E C I Ó N   3.1 =====
% ----------------------------------------------------------------------------
% El uso de F5 corre todo el código del tirón.
% El uso de F10 corre línea a línea de manera pausada, lo que permite analizar más su comportamiento.

% ===== P R I M E R A   I T E R A C I Ó N =====
%  ---------------------------------------------

% ===== PRIMERA PARTE. =====
% --------------------------
f1=@(x) 1+abs(x.^3 - 3*x);      % Definicion de la funcion.
x_0=-2; lado=4; n=3;            % Inicializacion de datos.

lado=lado/n;
for i=1:n                       % Bucle para generar representantes.
	representantes(i) = x_0 + (i-1)*lado;
end
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')


% ===== SEGUNDA PARTE. =====
% --------------------------
L=9; cte_compa=L*lado;           % sqrt(1)=1 y el factor lado ya incluye la cte de division.
for i=num_repr:-1:1              % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')




% ===== S E G U N D A   I T E R A C I Ó N. =====
%  ----------------------------------------------

lado=lado/n;
aux_repr=[];
for i=1:length(representantes)
	for k=1:n
		aux_repr((i-1)*n+k)=representantes(i)+(k-1)*lado;
	end
end
representantes=aux_repr;
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')

cte_compa=cte_compa/n;
for i=num_repr:-1:1 % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')





% ===== T E R C E R A   I T E R A C I Ó N. =====
%  ---------------------------------------------

lado=lado/n;
aux_repr=[];
for i=1:length(representantes)
	for k=1:n
		aux_repr((i-1)*n+k)=representantes(i)+(k-1)*lado;
	end
end
representantes=aux_repr;
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')

cte_compa=cte_compa/n;
for i=num_repr:-1:1 % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')




% ===== C U A R T A   I T E R A C I Ó N. =====
%  -------------------------------------------

lado=lado/n;
aux_repr=[];
for i=1:length(representantes)
	for k=1:n
		aux_repr((i-1)*n+k)=representantes(i)+(k-1)*lado;
	end
end
representantes=aux_repr;
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')

cte_compa=cte_compa/n;
for i=num_repr:-1:1 % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
plot([representantes; representantes+lado], [imagenes; imagenes], 'Color', 'blue')




% ===== Q U I N T A   I T E R A C I Ó N. =====
%  -------------------------------------------

lado=lado/n;
aux_repr=[];
for i=1:length(representantes)
	for k=1:n
		aux_repr((i-1)*n+k)=representantes(i)+(k-1)*lado;
	end
end
representantes=aux_repr;
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

scatter(representantes, imagenes, 'blue')

cte_compa=cte_compa/n;
for i=num_repr:-1:1 % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
scatter(representantes, imagenes, 'blue')





% ===== S E X T A   I T E R A C I Ó N. =====
%  -----------------------------------------

lado=lado/n;
aux_repr=[];
for i=1:length(representantes)
	for k=1:n
		aux_repr((i-1)*n+k)=representantes(i)+(k-1)*lado;
	end
end
representantes=aux_repr;
num_repr=length(representantes);
imagenes = f1(representantes);
minimo=min(imagenes);

scatter(representantes, imagenes, 'blue')

cte_compa=cte_compa/n;
for i=num_repr:-1:1 % Bucle aplicando el criterio de eliminacion.
	if (imagenes(i)-minimo) > cte_compa
		representantes(i)=[];
		imagenes(i)=[];
	end
end
num_repr=length(representantes);
scatter(representantes, imagenes, 'blue')




% Aumentar el número de iteraciones requiere la copia manual de la segunda
% iteración. Desde la línea 43 hasta la línea 65.
