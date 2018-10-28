
#Durante la sincronización del nodo se me queda en el siguiente estado y no avanza
Problema en la sincronización:
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/sync%20fail.png "Problema en la sincronización")

El comando para la sincronización utiliza el modo "light" (que en principio validaría sólo las cabeceras):
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/order%20sincronizaci%C3%B3n.png "Modo light")

Una vez sincronizado el nodo habría que:
1) Modificar la dirección del contracto y el pulic resolver del siguiente archivo àra adecualo a la red de Rinkeby:
https://github.com/ensdomains/ens/blob/master/ensutils-testnet.js

contract address: 0xe7410170f87102df0055eb195163a03b7f2bff4a (line 220)
publicResolver address: 0x5d20cf83cb385e06d2f2a892f9322cd4933eacdc (line 1314)

Al respecto, se adjunta el archivo modificado: 
[ensutils-testnet.js](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/ensutils-testnet.js)

Creamos una cuenta en la red:
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/nueva%20cuenta.png "Nueva cuenta")

Desbloqueamos la cuenta creada:

