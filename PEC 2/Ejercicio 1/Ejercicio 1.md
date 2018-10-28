
#Durante la sincronización del nodo se me queda en el siguiente estado y no avanza
Problema en la sincronización:
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/sync%20fail.png "Problema en la sincronización")

El comando para la sincronización utiliza el modo "light" (que en principio validaría sólo las cabeceras):
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/order%20sincronizaci%C3%B3n.png "Modo light")

Una vez sincronizado el nodo habría que:
1) Modificar la dirección del contracto y el pulic resolver del siguiente archivo y adecuarlo a la red de Rinkeby:
https://github.com/ensdomains/ens/blob/master/ensutils-testnet.js

contract address: 0xe7410170f87102df0055eb195163a03b7f2bff4a (line 220)
publicResolver address: 0x5d20cf83cb385e06d2f2a892f9322cd4933eacdc (line 1314)

Al respecto, se adjunta el archivo modificado: 
[ensutils-testnet.js](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/ensutils-testnet.js)

Creamos una cuenta en la red e intentamos cargar el archivo ensutils-testnet.js:
![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%202/Ejercicio%201/error_rinkeby.png "Nueva cuenta")

Vemos que nos sale un error por no estar sincronizado con el nodo.

Adicionalmente habría que seguir los siguientes pasos:
1)Desbloquear la cuenta creada:
web3.personal.unlockAccount(web3.personal.listAccounts[0],"<password>", 15000)
  
2)Chequear que nadie tiene el dominio que vamos a pedir:
new Date(testRegistrar.expiryTimes(web3.sha3('myname')).toNumber() * 1000)

3) Registrarlo:
testRegistrar.register(web3.sha3('myname'), eth.accounts[0], {from: eth.accounts[0]})

4) Unirlo al public resolver de la red:
ens.setResolver(namehash('myname.test'), publicResolver.address, {from: eth.accounts[0]});

5)Unimos el dominio con nuestra cuenta (y se lo decimos al resolvedor): 
publicResolver.setAddr(namehash('myname.test'), eth.accounts[0], {from: eth.accounts[0]});

