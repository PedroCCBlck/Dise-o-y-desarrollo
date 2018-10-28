
#Durante la sincronización del nodo se me queda en el siguiente estado y no avanza
Problema en la sincronización:
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/sync%20fail.png "Problema en la sincronización")

El comando para la sincronización utiliza el modo "light" (que en principio validaría sólo las cabeceras):
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/order%20sincronizaci%C3%B3n.png "Modo light")

Una vez sincronizado el nodo habría que:
1) Modificar la dirección del contracto y el pulic resolver del siguiente archivo:
https://github.com/ensdomains/ens/blob/master/ensutils-testnet.js

Al respecto, se adjunta el archivo modificado: 
[Terminal con la instalación](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%202/Instalacion%20IPFS)
