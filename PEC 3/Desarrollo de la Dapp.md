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

Para crear el frontend vamos a utilizar un diseño sencillo que permita a los centros de salud, hospitales y compañías de seguros subir datos a la blockchain y consultarlos. Tomamos como base el frontal del siguiente proyecto:

[Referencia](https://github.com/IvanAbadzhiev/DecentralizedCarLog)

Sobre este frontal vamos a hacer las modificaciones pertinentes para incluir los siguientes indicadores médicos (con sus valores umbrales):
1) Glucosa (70-110 mg/dl)
2) Colesterol general (120-200 mg/dl)
3) Trigliceridos (30-220 mg/dl)
4) Ácido urico (2-7 mg/dl)
5) Linfocitos (1.300-4.000 /mL)
