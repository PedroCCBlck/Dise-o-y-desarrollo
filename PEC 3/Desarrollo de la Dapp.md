El primer paso de todos es pensar en una aplicación que se ajuste lo más posible al diagrama de decisión en la implementación de una Dapp:

![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/diagrama%20de%20decisi%C3%B3n%20blockchain.png "Blockchain decision")

Dentro del siguiente artículo (relativo a la Comisión Europea) obtenemos la idea de crear una aplicación para la gestión descentralizada de los datos médicos y el acceso por parte de diversos centros médicos:

[EU Blockchain](https://ec.europa.eu/digital-single-market/en/blockchain-technologies)

La idea es positiva por apoyarse en varios factores:
1) Parte de la idea de tener una base de datos descentralizada en la que los centros de salud y hospitales pertenecientes a una red pública puedan acceder a los datos.
2) Se necesita una única versión de los datos de salud de los pacientes. Esto evitará que si el paciente traslada su lugar de residencia, el nuevo centro al que acuda tenga registros propios.
3) Debido a que los datos son fuertemente sensibles (según GDPR), es necesaria la implementación de fuertes medidas de seguridad desde el diseño de la aplicación.
4) El medio no es confiable (si, por ejemplo, se adhieren terceras partes como compañías de seguros y de salud).

Para preservar la privacidad de los datos, se optaría por una red Blockchain privada. Si se quisiera trasladar la funcionalidad a la red pública se tendría que preservar la privacidad de los datos a través de algoritmos como los ZPK (Zero Proof Knowledge). Este aspecto último queda fuera del scope de la entrega (ZPK).

A nivel de aplicación lo que se ha creado es un frontal que permita introducir los datos médicos de los pacientes, consultarlos de manera agregada (riesgo del paciente según un modelo de valoración y hospital al que es asignado) y borrar los datos. Por cada una de estas acciones, el Metamask se ejecuta para hacer efectiva la transacción. Además, destacar que por cada transacción ejecutada se retiran tokens del balance del usuario que ejecuta el frontal (el owner o el msr.sender) y se ingresa la misma cantidad al paciente afectado.

Con respecto al frontal, está formado por los siguientes elementos:
1) El circuit breaker (se modificaría introduciendo las palabras "True" y "False"). El campo podría ser modificado únicamente por el owner. Este mecanismo inhabilita las funciones de escritura y borrado del contrato.
2) Los datos médicos de los pacientes y su identificador: glucosa, triglicéridos, colesteros, áccido úrico, linfocitos y su número de identificación.
3) Botones para ejecutar los datos introducidos (mencionados en el punto 2) y para consultar el riesgo y el hospital asignado al paciente. El dato de entrada (key) al mapping que permite acceder a los datos de los pacientes viene dado por el campo de entrada "Identificador de paciente" de la sección "consulta de datos" del front.
Destacar además que los datos "riesgo" y "hospital" se calculan mediante una suma ponderada de los datos médicos mencionados en el punto 2:

![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/Modelo%20calculo%20riesgo.png "Modelo riesgo")
    
4) Botón para borrar los datos del paciente identificado (utiliza el campo de entrada "Identificador de paciente" de la sección "consulta de datos" del front).
5) Debajo del botón "Borrar datos" se sitúa una pequeña tabla (con dos columnas) para visualizar el riesgo obtenido (según el modelo) y el hospital al que es asignado un paciente específico.
6) Por último, se han incluido 3 secciones del front que dan información (en forma de texto) al usuario:

        _En la parte superior: El saldo del usuario de la web (por cada acción de escritura, consulta y borrado se le descontarán 50             tokens de su saldo).
        _También en la parte superior: El número de cuenta utilizada por el usuario.Si el address de la cuenta del suario se cambia, la         página web se recarga.
        _Debajo del botón de envío de datos: Una cadena de texto que muestra el estado de la aplicación.

Así, el procedimiento de ejecución sería:
1) Introducir los datos del paciente. El campo "Identificador del paciente" de la sección "envío de datos" es el que se utilizará como key para escribir en el mapping del paciente. 
2) Pulsar el botón "envío de datos" y aceptar la transacción.
3) Una vez aceptada la transacción en Metamask, se puede consultar los datos de ese mismo paciente (utilizando el campo "Identificador de paciente" de la sección "Consulta de datos"). Para ello hay que pulsar el botón "Consulta de datos" y aceptar la transacción.
4) En la tabla que se sitúa debajo del botón "Borrar datos" aparecerán los datos "riesgo" y "Hospital" del paciente.
5) Si se pulsa el boton de "borrar datos" se eliminará el registro del mapping de pacientes.
6) Finalmente destacar que si el owner del contrato introduce la palabra "True" en el "control de parada" las funciones de escritura y borrado no se podrán ejecutar. 

A continuación se muestra una imagen del frontal:
![alt text] (https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/Captura%20front%20bueno.png "Frontal")

Se han incoorporado algunas medidas de seguridad sobre la Dapp:

    _Validaciones de entrada del frontal: Para evitar que se produzca un ataque de inyección de entrada. La especificación de esta parte    del código se encuentra en el archivo html (Dapp Pacientes\app\index.html).
    _El mecanismo del circuit breaker: Que permite que si el owner del contrato quiere parar las operaciones de escritura y borrado, lo     pueda hacer. Este aspecto se ha conseguido con un campo de entrada al front y a través de una llamada a una función en el index.js      (Dapp Pacientes\app\scripts\). Además se produce el almacenamiento del valor en una variable en el contrato: Pacientes.sol.
    _Que sólo sea el owner quien pueda ejecutar determinadas funciones del contrato (como el borrado y el almacenamiento de la variable     para el circuit breaker). Conseguimos este aspecto mediante el modificador "onlyOwner" (definido en el contrato "Owned").
    _Seguridad en las operaciones aritméticas (para evitar posibles desbordamientos). Para ello se ha utilizado la librería "SafeMath"       de Oppen Zeppelin.

Mencionar adicionalmente que se ha implementado un mecanismo de herencia mediante el uso de la función "Owned" ("Owned.sol") para regular las acciones que sólo puede ejecutar el owner. Además, se ha utilizado una función aritmética de Oppen Zeppelin.

Por último, señalar que se han realizado una serie de test sobre las funciones utilizadas en el contrato principal. El resultado de estos test se pueden observar en la siguiente imagen:

![alt text]( https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/test.png "Test")

Los aspectos fundamentales que se han tenido en cuenta en estos test (detallados en el script: "Test.js") han sido:
    _La corrección de las direcciones generadas en los contratos.
    _La correción en la ejecución de los eventos de cada función del contrato.
    
Las modificaciones fundamentales que se han realizado en el frontal webpack de Truffle (que se ha utilizado como plantilla) ha afectado a los siguientes scripts:

    _Index.html (Dapp Pacientes\app\).

    _Index.js (Dapp Pacientes\app\scripts\)

    _Los archivos .sol de la carpeta contracts (menos la librería "SafeMath.sol", que la tomé directamente de OpenZeppelin).

    _Los test:  test.js (Dapp Pacientes\test\).

El resto, como digo, utiliza la misma estructura que la plantilla de Truffle (webpack).


