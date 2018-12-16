El primer paso de todos es pensar en una aplicación que se ajuste lo más posible al diagrama de decisión en la implementación de una Dapp:

![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/diagrama%20de%20decisi%C3%B3n%20blockchain.png "Blockchain decision")

Dentro del siguiente artículo (relativo a la Comisión Europea) obtenemos la idea de crear una aplicación para la gestión descentralizada de los datos médicos y el acceso por parte de diversos centros médicos:

[EU Blockchain](https://ec.europa.eu/digital-single-market/en/blockchain-technologies)

La idea es positiva por apoyarse en varios factores:
1) Parte de la idea de tener una base de datos descentralizada en la que los centros de salud y hospitales pertenecientes a una red pública puedan acceder a los datos.
2) Se necesita una única versión de los datos de salud de los pacientes. Esto evitará que si el paciente traslada su lugar de residencia, el nuevo centro al que acuda tenga registros propios.
3) Debido a que los datos son fuertemente sensibles (según GDPR), es necesaria la implementación de fuertes medidas de seguridad desde el diseño de la aplicación.
4) El medio no es confiable (si, por ejemplo, se adhieren terceras partes como compañías de seguros y de salud).

Para preservar la privacidad de los datos, se optaría por una red Blockchain privada. Si se quisiera trasladar la funcionalidad a la red pública se tendría que preservar la privacidad de los datos a través de algoritmos como los ZPK (Zero Proof Knowledge).

A nivel de aplicación lo que se ha creado es un frontal que permita introducir los datos médicos de los pacientes, consultarlos de manera agregada (riesgo del paciente y hospital que se le asigna) y borrar los datos. Por cada una de estas acciones, el Metamask se ejecutará para hacer efectiva la transacción. Además, destacar que por cada transacción ejecutada se retirará tokens del balance del usuario que ejecuta el frontal (el owner o el msr.sender) y se ingresa la misma cantidad al paciente afectado.

Con respecto al frontal, está formado por los siguientes elementos:
1) El circuit breaker (se modificaría introduciendo las palabras "True" y "False"). El campo podría ser modificado únicamente por el owner. Esta función inhabilita las funciones de escritura y borrado del contrato.
2) Los datos médicos de los pacientes y su identificador: glucosa, triglicéridos, colesteros, áccido úrico, linfocitos y su número de identificación.
3) Botones para ejecutar los datos introducidos (mencionados en el punto 2) y para consultar el riesgo y el hospital asignado al paciente. El dato de entrada (key) al mapping que permite acceder a los datos de los pacientes viene dado por el campo de entrada "Identificador de paciente" de la sección "consulta de datos" del front.
Destacar además que los datos "riesgo" y "hospital" se calculan mediante una suma ponderada de los datos médicos mencionados en el punto 2:

const RiesgoNum=(Glucosa/110)*0.3+(Colesterol/200)*0.1+(Trigliceridos/220)*0.2+(AcidoUrico/7)*0.1+(Linfocitos/4000)*0.3;
    //diseñamos un pequeño modelo de valoración del riesgo del paciente. Primero normalizamos y luego ponderamos según nuestro modelo
    var Riesgo;
    var Hospital;
    if (RiesgoNum<=0.4){
    Riesgo="Low";
    Hospital="A";
    }
    else if (RiesgoNum>0.4 && RiesgoNum<=0.7) {
      Riesgo="Medium";
      Hospital="B";

    }
    else {
    Riesgo="High";
    Hospital="C";
    }
    
4) Botón para borrar los datos del paciente identificado con el campo de entrada "Identificador de paciente" de la sección "consulta de datos" del front.
5) Debajo del botón "Borrar datos" se sitúa una pequeña tabla (con dos columnas) para visualizar el riesgo y el hospital de un paciente específico.
6) Por último se han incluido 3 secciones del front que dan información (en forma de texto) al usuario:
_En la parte superior: El saldo del usuario de la web (por cada acción de escritura, consulta y borrado se le descontarán 50 tokens de su saldo).
_También en la parte superior: El número de cuenta utilizada por el usuario.
_Debajo del botón de envío de datos: Una cadena de texto que muestra el estado de la aplicación.

Así, el procedimiento de ejecución sería:
1) Introducir los datos del paciente. El campo "Identificador del paciente" de la sección "nvío de datos" es el que se utilizará como key para escribir en el mapping del paciente. 
2) Pulsar el botón envío de datos y aceptar la transacción.
3) Una vez aceptada la transacción en Metamask, se puede consultar los datos de ese mismo paciente (utilizando el campo "Identificador de paciente" de la sección "Consulta de datos"). Para ello hay que pulsar el botón "Consulta de datos" y aceptar la transacción.
4) En la tabla que se sitúa debajo del botón "Borrar datos" aparecerán los datos "riesgo" y "Hospital" del paciente.
5) Si se pulsa el boton de borrar se eliminará el registro dle paciente del mapping de pacientes.
6) Finalmente destacar que si el owner del contrato introduce la palabra "True" en el "control de parada" las funciones de escritura y borrado no se podrán ejecutar.

A continuación se muestra una imagen del frontal:
[Frontal] (https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/Frontal.html)

