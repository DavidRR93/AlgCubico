function [min_f, repr, iter, lado_fin]=AlgCubico(N, n, func, L, lado, v_inf, tol, max_iter)

format longE

% DESCRIPCIÓN DE VARIABLES DE ENTRADA.
% ------------------------------------
% N          % Dimensión del problema.
% n          % Cte de partición.
% funcion    % La función objetivo de la que se busca el mínimo global.
                % Damos por hecho que la función está bien definida con
                % número correcto de variables.
                % Se define como función M A T R I C I A L.
                % Ejemplo: f(x, y) = y - x sería f=@(M) (M(2,:) - M(1,:))
% L          % Cte de Lipschitz (o aproximación) de la función.
% lado       % Lado del cubo y dominio.
% v_inf      % Vértice inferior del dominio cúbico.
% tol        % Precisión con la cual se da por buena la aproximación.
% max_iter   % Número máximo de iteraciones admisibles.


% DESCRIPCIÓN DE VARIABLES DE SALIDA.
% -----------------------------------
% min_f      % Valor aproximado del mínimo absoluto.
% repr       % Lista de representantes de cubos que pueden contener minimizadores.
% iter       % Número de la iteración en la que se ha detenido el programa.
% lado_fin   % Longitud de los últimos subcubos generados.


% INICIALIZACIÓN DE VARIABLES.
% ----------------------------
cte_elim=L*lado*sqrt(N);    % Cte de eliminación. La inicializamos así y en cada iteración la
                                % dividimos por la constante de partición.
iter=1;                     % Número de iteración.


% ===== GENERADOR DE CUADRÍCULA. ======
% -------------------------------------
% En cada cubo superviviente se genera el mismo tipo de partición o MALLA.
% La generamos fuera del bucle y la aplicamos a cada cubo.
% Se generan n^N puntos de N coordenadas, que listaremos como matriz.
% Cada columna será un punto. Cada fila, una coordenada.
malla=zeros(N,n^N);
for num=1:n^N
    num_aux=num-1;
    for comp=N:-1:1
        malla(N-comp+1, num)=floor(num_aux/(n^(comp-1)));
        num_aux=num_aux-malla(N-comp+1, num)*(n^(comp-1));
    end
end
clear num_aux; clear num;

% Empezamos con un único representante: el vértice inferior del dominio.
repr=v_inf;


while (iter<=max_iter)&&(cte_elim/(n^iter)>tol)
    
    % ===== CREACIÓN DE REPRESENTANTES. =====
    % ---------------------------------------
    % Calculamos también las imágenes de los representantes.
    repr_aux=[];
    for pos=1:size(repr,2)
        repr_aux=[repr_aux,repr(:,pos)+malla*(lado/(n^iter))];
    end
    repr=repr_aux;
    clear repr_aux;
    f_repr=func(repr);

    
    % ===== APROXIMACIÓN DEL MÍNIMO. ======
    % -------------------------------------
    min_f=min(f_repr);
    
    
    % ===== CRITERIO DE ELIMINACIÓN. =====
    % ------------------------------------
    pos_elim=[];
    pos_elim=find((f_repr-min_f)>(cte_elim/(n^iter)));
    f_repr(pos_elim)=[];
    repr(:,pos_elim)=[];


    iter=iter+1;

end
% ===== FIN DEL CUERPO PRINCIPAL. =====
% -------------------------------------

iter=iter-1;



% ===== CREACIÓN DE LA GRÁFICA. =====
% -----------------------------------
lado_fin=lado/(n^iter);
if N==1
    hold on
    %plot([repr(1,:); repr(1,:)+lado_fin], [f_repr; f_repr], 'o', 'Color',
    %'blue')
    plot([repr(1,:); repr(1,:)+lado_fin], [f_repr; f_repr], 'Color','blue')
    scatter(repr, f_repr, 'red')
elseif N==2
    %fill([repr(1,:); repr(1,:)+lado_fin; repr(1,:)+lado_fin; repr(1,:); repr(1,:)], ...
    %    [repr(2,:); repr(2,:); repr(2,:)+lado_fin; repr(2,:)+lado_fin; repr(2,:);], 'blue')
    scatter(repr(1,:), repr(2,:), 'blue')
elseif N==3
    scatter3(repr(1,:), repr(2,:), repr(3,:), 'blue')
end