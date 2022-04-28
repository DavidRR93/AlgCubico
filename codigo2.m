% ===== CÓDIGO DESARROLLADO PARA LA SECCIÓN 3.2 =====
% ---------------------------------------------------
% El uso de F5 corre todo el código del tirón.
% El uso de F10 corre línea a línea de manera pausada, lo que permite analizar más su comportamiento.


format longE    % Estilo de salida numérica: Notación científica con 15 decimales.

f3=@(v) 1+abs((v(1,:).^2 + v(2,:).^2).^3-3*(v(1,:).^2 + v(2,:).^2)); 		% Definición de la función.
x_0=[0;0]; lado=sqrt(2); n=4; 		% Inicialización de algunos datos.

lado=lado/n;
for i=1:n^2         % Bucle para crear una malla de división.
	i_aux=i-1;
	for componente=2:-1:1
		malla(2-componente+1, i)=floor(i_aux/(n^(componente-1)));
		i_aux=i_aux-malla(2-componente+1, i)*(n^(componente-1));
	end
end
clear i; clear i_aux; clear componente;


% ==== 1ª ITERACIÓN =====
% -----------------------

representantes=x_0+malla*lado;		 % Creación de represesentantes e imágenes.                                 
num_repr=size(representantes,2);
imagenes = f3(representantes);
minimo=min(imagenes);
	
L=180; cte_compa=L*lado*sqrt(2);		 	% El factor lado ya incluye la cte de división.
for i=num_repr:-1:1				        % Bucle aplicando el operador de eliminación.
	if (imagenes(i)-minimo) > cte_compa
		representantes(:,i)=[];
		imagenes(i)=[];
	end
end
clear i;


% ===== SIGUIENTES ITERACIONES =====
% ----------------------------------
% Para cada iteración extra que se quiera hacer, basta con repetir el
% código de esta parte.

    lado=lado/n; aux_repr=[];        		% Creación de nuevos representantes.
    for i=1:size(representantes,2)
	    for k=1:n^2
		    aux_repr(:,(i-1)*(n^2)+k)=representantes(:,i)+lado*malla(:,k);
	    end
    end
    clear i; clear k; 
    representantes=aux_repr;
    num_repr=size(representantes,2);
    imagenes = f3(representantes);
    minimo=min(imagenes);
	    
    cte_compa=cte_compa/n;		 
    for i=num_repr:-1:1				% Bucle aplicando el operador de eliminación.
	    if (imagenes(i)-minimo) > cte_compa
		    representantes(:,i)=[];
		    imagenes(i)=[];
	    end
    end
    clear i;
