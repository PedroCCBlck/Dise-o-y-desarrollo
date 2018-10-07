pragma solidity ^0.4.11;
contract c {
    uint256 a;
    uint256 b;
    uint256 d;
    
    constructor() public {
        a=1;
        d=25;
        dividir();
    }
    
function dividir() public
{
    b=d/a;
}
}
