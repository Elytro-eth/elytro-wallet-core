# ElytroWalletCore

ElytroWalletCore is a flexible and reusable smart contract wallet framework compliant with the EIP-4337 standard. It aims to provide a simple, adaptable, and easily integrable foundation for various wallet functionalities and extensions.

## ⚠️ Disclaimer

Although **ElytroWalletCore has been audited (thanks to SlowMist)**, it is important to note that the functions provided by this library are highly flexible. Users and developers should exercise caution and use at their own risk.

## Features

- **EIP-4337 Compliant**: Ensures alignment with the latest developments in the Ethereum community.
- **Modular Design**: Facilitates easy addition or removal of features by developers according to their needs.
- **Reusability**: Designed for easy reuse across different projects.
- **Wallet Implementation Examples**: Includes multiple wallet examples based on ElytroWalletCore to help developers get started quickly.

## Directory Structure

- `contracts/` - Contains all contract codes.
  - `base/` - Base contracts providing core functionalities.
  - `interface/` - Definitions of contract interfaces.
  - `snippets/` - Reusable code snippets.
  - `utils/` - Utility and helper contracts.
  - `validators/` - Contracts related to validators.
- `examples/` - Examples of wallets developed based on ElytroWalletCore.

## Getting Started

To start using ElytroWalletCore, clone the repository:

```sh
git clone https://github.com/Elytro-eth/elytro-wallet-core.git
cd elytro-wallet-core
```

Next, choose or modify the contract examples as per your requirements.

## Example Usage

Refer to the examples in the `examples/` directory to understand how to build custom wallets based on ElytroWalletCore.

- [BasicModularAccount](examples/BasicModularAccount.sol): A basic example of a modular account.
- [CustomAccessModularAccount](examples/CustomAccessModularAccount.sol): An example with custom permission.
- [AddFunctionDemo](examples/AddFunctionDemo/): An implementation example with a custom function added.
- [ModularAccountWithBuildinEOAValidator](examples/ModularAccountWithBuildinEOAValidator.sol): An example of a modular account with built-in EOA signature validation.
- [UpgradableModularAccount](examples/UpgradableModularAccount.sol): An example of an upgradable modular account.
  - Note: Due to the flexibility in implementing upgradable contracts, it is not implemented in ElytroWalletCore. However, you can refer to this example.

## Contributions

We welcome contributions in any form, be it feature enhancements, bug reports, or documentation updates. Please submit pull requests or issues through GitHub.

## License

This project is licensed under the [MIT License](LICENSE)
