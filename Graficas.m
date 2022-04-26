% Comándos básicos para la creación de gráficas con la intención de imprimir la familia de representantes
% obtenida mediante el Algoritmo Cúbico.
% Por ello, suponemos que contamos con las variables de salida de AlgCubico: repr, lado_fin.
% La variable f_repr se usa, pero no es una salida del algoritmo. Evidentemente, se puede calcular como f_repr=func(repr)


% ===== Cuando N=1 =====
% ----------------------
    % La representación gráfica se podría realizar sobre un mismo eje,
    % pero es más representativo imprimir el resultado como gráfica (punto, imagen).
    % Para ello se pueden usar los comandos:
plot([repr(1,:); repr(1,:)+lado_fin], [f_repr; f_repr], 'Color','blue')
    % Imprime los segmentos [repr(nº x); repr(nº x)+lado] en color azul a una altura igual a su imagen.
    % Muy recomendable cuando los representantes se concentran como un conjunto conexo.
scatter(repr, f_repr, 'blue')
    % Imprime redondeles 'o' azules centrados en el par (repr, imagen).
    % Muy recomendable cuando los representantes se concentran como conjuntos no conexos.


% ===== Cuando N=2 =====
% ----------------------
    % Cada representante identifica un cuadrado en R^2.
fill([repr(1,:); repr(1,:)+lado_fin; repr(1,:)+lado_fin; repr(1,:); repr(1,:)], ...
[repr(2,:); repr(2,:); repr(2,:)+lado_fin; repr(2,:)+lado_fin; repr(2,:);], 'blue')
    % Imprime el cuadrado azul de vértice inferior repr(nº columna) del lado indicado.
    % No muy recomendable cuando los representantes se concentran como conjunto no conexo.
    % Se podría hacer algo similar al caso N=1 e imprimirlos a sus correspondientes alturas,
      % dando cierta idea del comportamiento de su gráfica.
scatter(repr(1,:), repr(2,:), 'blue')
    % Imprime redondeles 'o' azules centrados en el punto (repr(1, nº col), repr(2, nº col)).


% ===== Cuando N=3 =====
% ----------------------
    % Cada representante identifica un cubo en R^3.
    % La vía más recomendada para su representación es 
scatter3(repr(1,:), repr(2,:), repr(3,:), 'blue')
    % Se podría imprimir cada cubo, pero MatLab no da la opción de crear sólidos.
    % La alternativa sería usar comandos fill (uno por cara del cubo, se puede evitar duplicar caras)
    % pero supondría un alto coste computacional; más alto teniendo en cuenta que la salida del programa
    % pueden ser matrices con millones de elementos.
    
