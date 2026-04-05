# NFT Marketplace

A decentralized NFT marketplace built on an EVM-based network and written in the Solidity language that supports NFT creation, auctions, offers, Fixed price sales, and time-based drops.

![Solidity](https://img.shields.io/badge/solidity-^0.8.17-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg)

## Features

- 🎨 ERC1155 NFT Collections
- ⏰ Time-based NFT Drops
- 💰 Fixed Price Trading
- 🔨 English Auctions System
- 💫 Offer System
- 💸 Configurable Fees & Royalties
- 📦 Batch Operations

## Prerequisites

- [Node.js](https://nodejs.org/en/) >= 14.0.0
- [Hardhat](https://hardhat.org/) >= 2.0.0
- [npm](https://www.npmjs.com/) >= 6.0.0

## Installation

1. Clone the repository:
```bash
git clone https://github.com/AnonymousCryptos/NFT-Marketplace.git
cd NFT-Marketplace
```

2. Install dependencies:
```bash
npm install
```

## Smart Contract Testing

Compile contracts:
```bash
npx hardhat compile
```

Run all the tests:
```bash
npx hardhat test
```

Run a specific testcase file:
```bash
npx hardhat test test/unit/BaseCollection.test.js
```

Generate coverage report:
```bash
npx hardhat coverage
```

## Project Structure

```
NYWNFT-Marketplace/
├── contracts/
│   ├── core/
│   │   ├── BaseCollection.sol
│   │   ├── Drop.sol
│   │   └── CollectionFactory.sol
│   ├── interfaces/
│   │   ├── ICollection.sol
│   │   └── IDrop.sol
│   └── marketplace/
│       └── NFTMarketplace.sol
│   └── mocks/
│   │   ├── MockERC1155.sol
│   │   ├── MockERC20.sol
│   │   ├── MockReentrantBaseCollection.sol
│   │   ├── NFTMarketplaceMock.sol
│   │   ├── ReentrantERC1155Mock.sol
│   │   ├── ReentrantMock.sol
│   │   ├── TestCallerMock.sol
│   │   └── TestMinterMock.sol
│   
├── test/
│   ├── unit/
│   │   ├── BaseCollection.test.js
│   │   ├── Drop.test.js
│   │   ├── NFTMarketplace.test.js
│   │   └── CollectionFactory.test.js
│   ├── integration/
│   │   └── CompleteFlow.test.js
│   └── helpers/
│       ├── setup.js
│       └── commonFunctions.js
└── docs/
    └── Document.md
```

Current gas estimates:
- Collection Deployment: ~2.5M gas
- NFT Creation: ~150K gas
- Trading Operations: ~100K-200K gas

## Security

- Contracts use OpenZeppelin's secure implementations
- ReentrancyGuard for all fund transfer functions
- Comprehensive access control for better security
- 100% test coverage with all positive & negative scenarios covered

## For Contribution

1. Fork the repository
2. Create your feature branch:
```bash
git checkout -b feature/my-new-feature
```
3. Commit your changes:
```bash
git commit -am 'Add some feature.'
```
4. Push to the branch:
```bash
git push origin feature/my-new-feature
```
5. Submit a pull request for review/approval


## Documentation

- [Technical Documentation](docs/Document.md)

## Acknowledgments

- OpenZeppelin – used for contract implementations
- Hardhat – used as the development framework for the project.
- Ethers.js – used for testing and interaction with contracts
