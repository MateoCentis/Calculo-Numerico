n = norm(v) devuelve la norma euclidiana del vector v. Esta norma tambi�n se llama norma 2, magnitud vectorial o longitud euclidiana.

ejemplo
n = norm(v,p) devuelve el vector generalizado norma p.

ejemplo
n = norm(X) devuelve la norma 2 o el valor singular m�ximo de la matriz X, que es aproximadamente max(svd(X)).

ejemplo
n = norm(X,p) devuelve la norma p de la matriz X, en la que p es 1, 2 o Inf:

Si p = 1, n es la suma de columna absoluta m�xima de la matriz.

Si p = 2, n es aproximadamente max(svd(X)). Esto equivale a norm(X).

Si p = Inf, n es la suma de fila absoluta m�xima de la matriz.

ejemplo
n = norm(X,'fro') devuelve la norma de Frobenius de la matriz X.