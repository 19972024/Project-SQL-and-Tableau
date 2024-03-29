# Project-SQL-and-Tableau

Spanish Wines


![download](https://github.com/19972024/Project-SQL-and-Tableau/assets/156945446/2641d28d-7526-4686-9bb2-dbea8c318a6e)



Herramientas:

Utilizamos un data base obtenida de Kaggle llamada wine_spa que recopila mas de 8000 datos de vinos españoles y los categoriza por precio, rating, acidez, cuerpo, se logra distinguir las diferentes bodegas (cantinas) con su respectivo nombre de botellas analizadas.
Como segundo data base tambien fue utlizado un df obtenido de kaggle llamado vinos que recopila mas de 18 000 datos de vinos de todo el mundo, donde se puede apreciar tambien los diferentes precios, ratings, reviews de diferentes sommeliers tambien agrupado por las diferentes bodegas (cantinas) con sus respectivos nombre de botellas.
Para analizar estos datos fueron utlizadas diferentes tecnicas de Sql para las consultas, recopilacion de informacion, y donde fueron aplicadas diferentes funciones para como uniones (joins), subconsultas, agrupaciones etc.
Luego para graficar los datos utilizamos la plataforma de tableau public, para exponer diferentes caracteristicas que logramos analizar y graficar con diferentes resultados.

Aqui link: https://public.tableau.com/app/profile/matteo.stefano.ortalli/vizzes

.Dashbord 1:

Aqui buscamos a traves de un map graficar dos columnas diferentes que son precio y rating, en la primera hicimos un promedio de todos los precios analizados en el dfdonde se ve como se resaltan las regiones vitivinicolas con un promedio de precio superior a las otras, para poder ser mas especificos tambien hicimos una tabla  que demuestra estos datos.

Tambien en el segundo map hicimos lo mismo pero con la columna de rating donde se ve como algunas regiones resaltan en este aspecto sin tener un promedio de precios altos, aqui tambien realizamos una tabla donde analiza esta situacion y demuestra interesantes resultados.

Comentario interesante para este dashbord que tuvieron que buscarse region por region a que provincias pertenecian para poder cargarlos al mapa.

.Dashbord 2:

En este segundo dashbord lo que hicimos fue analizar dos columnas diferentes que son acidez y cuerpo (body).

En cuanto a la columnas acidez nos preguntamos si los + "acidos" tienen un precio mayor o menor y si tienen tambien un rating mayor o menor, para verificarlo, lo que hicimos es a traves de burbujas agrupadas, donde a traves de diferentes filtros, nivel de acidez: 1,2,3 o NA (que indica que en la muestra no fue especificada).
Moviendo los diferentes filtros vemos como los circulos de diferentes colores y tamaños demuestran que los vinos con mayor acidez tienden a tener un mayor precio y rating a expecion de uno que es el Pedro Jimenez que es un vino digamos dulce.
Nota importante de por que sucede esto: la acidez es uno de los componentes esenciales en el vino y tiene varias funciones, por ejemplo restringe la accion de las bacterias que puedan dañar el vino, a nivel organoleptico aporta una sensacion de equilibrio y frescor.

En la columna body logramos y buscamos hacer lo mismo con la columna acidez, siempre a traves de un grafico de burbujas agrupadas, donde a traves de diferentes filtros, nivel de cuerpo 1,2,3,4,5 o NA (que indica que en la muestra no fue especificada). Moviendo los diferentes filtros vemos como los circulos de diferentes colores y tamaños demuestran que los vinos con mayor cuerpo tienden a tener un mayor precio y rating a expecion de algunos Cava que tienen rating y precios altos.
Nota importante: en terminos generales, el cuerpo del vino se refiere a la sensacion de peso o textura que el vino tiene en la boca, esto lleva a que un vino se sienta ligero o que sienta denso y pesado.

.Dashbord 3:

En este ultimo dashbord buscamos analizar a traves de un diagrama de campos y valores los diferentes rangos de precios que existen entre los diferentes tipos de vino, aqui logramos ver que hay bastante similitudes entre las diferentes tipologias de vino, con alguna que otra expecion donde vemos que los precios estan en un rango mayor.
Tambien se pueden ver los diferentes vinos por su precio min y max, aqui podemos ver como el vino mas caro analizado en esta tabla es el  LA FARAONA BIERZO variedad es 96% Mencía + 4% Jerez + Godello y su Denominación de Origen es Bierzo, algunos aspectos interesantes de este vino es que no se realiza todos los años, ya que se tienen que cumplir diferentes condiciones climatologicas que no se dan todos los años.

Para finalizar tenemos un grafico de lineas que compara los precios maximos, minimos y el promedio de estos a travez de los años 1910-2021. Con interesantes resultados 
