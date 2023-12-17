// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract WalletList {
    address public owner; //Address of Owner
    mapping(address => bool) userWalletList; //Mapping to store wallet address

    event WalletAdded(address indexed wallet); //Event triggered when a new wallet is added

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "WalletList: Only authorised user can access"
        );
        _;
    }

    /**
     * @dev Function to add a new wallet address to the list.
     * @notice This method will allow only Owner to add wallet.
     * @param _walletAddress: The new wallet address.
     */
    function addWallet(address _walletAddress) external onlyOwner {
        require(
            !userWalletList[_walletAddress],
            "WalletList: Wallet is already listed"
        );
        userWalletList[_walletAddress] = true;
        emit WalletAdded(_walletAddress);
    }

    /**
     * @dev Function to check wallet address is listed.
     * @notice This method will allow to check specific wallet address is listed.
     * @param _walletAddress: The wallet address to check.
     */
    function isWalletListed(
        address _walletAddress
    ) external view returns (bool) {
        return userWalletList[_walletAddress];
    }
}
