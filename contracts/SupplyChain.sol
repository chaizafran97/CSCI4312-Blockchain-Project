// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract NewSupplyChain {

   struct cargo{
    uint256 cargoID;
    uint256 cargoPrice;
    string cargoDetails;
    string cargoCoordinates;
	string buyer;
	string cargoState;
    }

    address owner;
    cargo[] public Cargo;

    event cargoBuy(uint256 temp);
    event CargoMovedToCourier(uint256 temp);
    event CargoMovedToCustoms(uint256 temp);
    event CargoDeliveredToBuyer(uint256 temp);

    constructor() public {
        owner = msg.sender;
    }

	//initialize cargo, buyer can be left as N/a yet
    function initializeCargo(
        uint256 cargoPrice,
        string memory cargoDetails,
        string memory cargoCoordinates,
		string memory buyer
    ) public {
		uint cargoID = 0;
		string memory cargoState = "With Seller";
      	Cargo.push(cargo(cargoID,cargoPrice,cargoDetails,cargoCoordinates,buyer,cargoState));
	 	cargoID++;
    }

	//function that allows us to put the buyer name
	function cargoBought(uint256 _id, string memory _temp) public {
		Cargo[_id].buyer = _temp;
		Cargo[_id].cargoState = "Order Created";
	}

	//function that states the cargo is currently shipping
	function cargoShipped(uint256 _id) public {
		Cargo[_id].cargoState = "Order currently shipping";
	}

	//function that states buyer has received
	//an if else statement needs to be added so this state can only be achieved when cargo location and buyer address matches
	function cargoReceieved(uint256 _id) public {
		Cargo[_id].cargoState = "Buyer has received";
	}

	//meant for testing if we can see the cargo
	function viewCargo(uint256 _temp) public view 
	returns(uint256, uint256, string memory, string memory, string memory){
	return(Cargo[_temp].cargoID, Cargo[_temp].cargoPrice, Cargo[_temp].cargoDetails,
	Cargo[_temp].cargoCoordinates, Cargo[_temp].buyer);
	}



    }