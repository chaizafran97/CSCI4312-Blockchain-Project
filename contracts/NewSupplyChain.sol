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

contract NewSupplyChain {
    event SellerAdded(address indexed _account);

    uint256 public cargoID;
    address owner;

    mapping(uint256 => Structures.cargo) public Cargo;

    event cargoBuy(uint256 temp);
    event CargoMovedToCourier(uint256 temp);
    event CargoMovedToCustoms(uint256 temp);
    event CargoDeliveredToBuyer(uint256 temp);

    constructor() public {
        owner = msg.sender;
    }

    modifier orderCreated (uint256 _temp){
        require(Cargo[_temp].cargoState == Structures.State.OrderCreated);
        _;
    }

    modifier cargoMovedToCourier(uint256 _temp){
        require(Cargo[_temp].cargoState == Structures.State.Shipping);
        _;
    }

        modifier cargoMovedToCustoms(uint256 _temp){
        require(Cargo[_temp].cargoState == Structures.State.PassedtoLocalCustoms);
        _;
    }

        modifier cargoDelivered(uint256 _temp){
        require(Cargo[_temp].cargoState == Structures.State.Delivered);
        _;
    }

    function initializeCargo(
        string memory cargoID,
        uint256 cargoPrice,
        string memory cargoDetails,
        string memory cargoCoordinates
    ) public {
      Structures.cargo memory Cargo;
      Cargo.cargoID = cargoID;
      Cargo.cargoPrice = cargoPrice;
      Cargo.cargoDetails = cargoDetails;
      Cargo.cargoCoordinates = cargoCoordinates;
    }

    function cargoBought(uint _temp) public {
        Cargo[_temp].buyer.buyer = msg.sender;
        Cargo[_temp].cargoState = Structures.State.OrderCreated;
        emit cargoBuy(_temp);
    }

    //function that will be used when passed to courier
    function cargoPassedToCourier(uint _temp) public {
        Cargo[_temp].cargoState = Structures.State.Shipping;
        emit CargoMovedToCourier(_temp);
    }


	function moveCargoToCustoms(uint256 _temp) public {
		Cargo[_temp].cargoState = Structures.State.PassedtoLocalCustoms;
        emit CargoMovedToCustoms(_temp);
	}

	//function that will be used when passed to courier
	function moveCargoToBuyer(uint256 _temp) public {
		Cargo[_temp].cargoState = Structures.State.Delivered;
        emit CargoDeliveredToBuyer(_temp);
	}
}