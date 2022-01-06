// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

library Structures {
    enum State{
        WithSeller,
        OrderCreated,
        PassedtoLocalCustoms,
        Shipping,
        Delivered
    }

struct sellerDetails{
    address seller;
    string sellerName;
}

struct buyerDetails{
    address buyer;
    string buyerName;
    string buyerCoordinates;
}

struct cargo{
    string cargoID;
    uint256 cargoPrice;
    string cargoDetails;
    address currentOwner;
    State cargoState;
    buyerDetails buyer;
    string cargoCoordinates;
}

struct roles {
    bool seller;
    bool buyer;
    bool courier;
    bool customs;
}
}