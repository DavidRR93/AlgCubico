function [min_f, repr, iter, lado_fin]=AlgCubico(N, n, func, L, lado, v_inf, tol, max_iter)

format longE %Formato numérico de salida: notación científica con 15 decimales.

% DESCRIPCIÓN DE VARIABLES DE ENTRADA.
% ------------------------------------
% N          % Dimensión del problema. Debe ser un valor natural.
% n          % Cte de partición. Debe ser un valor natural mayor o igual a 2.
% funcion    % La función objetivo de la que se busca el mínimo global.
                % Damos por hecho que la función está bien definida con
                % número correcto de variables acorde a N.
                % Se define como función M A T R I C I A L.
                % Ejemplo: f(x, y) = y - x^2 sería f=@(M) (M(2,:) - M(1,:).^2)
% L          % Cte de Lipschitz (o aproximación) de la función. Debe ser un valor positivo.
% lado       % Lado del cubo y dominio. Debe ser un valor positivo.
% v_inf      % Vértice inferior del dominio cúbico.
                % Debe tener un número correcto de componentes acorde a N.
% tol        % Precisión con la cual se da por buena la aproximación.
             % No debe superar la precisión establecida para MatLab.
% max_iter   % Número máximo de iteraciones admisibles. Debe ser un valor natural.


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
iter=1;                     % Índice de iteración.


% ===== GENERADOR DE CUADRÍCULA. ======
% -------------------------------------
% En cada cubo superviviente se genera el mismo tipo de partición o MALLA.
% La generamos fuera del bucle y la aplicamos a cada cubo.
% Se generan n^N puntos de N coordenadas, que listaremos como matriz.
% Cada columna será un punto de R^{N}. Cada fila, una coordenada.
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


% ===== INICIO DEL CUERPO PRINCIPAL. =====
while (iter<=max_iter)&&(cte_elim/(n^iter)>tol)
    
    % ===== CREACIÓN DE REPRESENTANTES. =====
    % ---------------------------------------
    repr_aux=[];
    for pos=1:size(repr,2)
        repr_aux=[repr_aux,repr(:,pos)+malla*(lado/(n^iter))];
    end
    repr=repr_aux;
    clear repr_aux;
    

    
    % ===== APROXIMACIÓN DEL MÍNIMO. ======
    % -------------------------------------
    f_repr=func(repr);
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
lado_fin=lado/(n^iter);


% Variables que se pueden agregar como salida del programa:
  % - f_repr;                     (Ya creada)
  % - num_elim = size(pos_elim, 2); (No creada. Representaría el número de índices eliminados en la iteración.)


