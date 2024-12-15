// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenA is ERC20, Ownable {
    // Constructor que inicializa el token
    constructor() ERC20("TokenA", "TKA") Ownable(msg.sender) {
        // Se asigna la cantidad inicial de tokens al creador del contrato (msg.sender)
        uint256 initialSupply = 1000 * 10 ** decimals();
        _mint(msg.sender, initialSupply);
    }

    // Función para crear nuevos tokens (solo el propietario puede llamarla)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Función para quemar tokens (solo el propietario puede llamarla)
    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
}
