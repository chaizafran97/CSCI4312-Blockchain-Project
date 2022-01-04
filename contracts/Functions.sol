// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SupplyChain{
	address cargoAddress;

	enum State{
		OrderCreated,			//0
		PassedToLocalCustoms,	//1
		Shipping,				//2
		Delivered				//3
	}

	struct Role{
		bool seller;
		bool buyer;
		bool customs;
		bool courier;
	}

	struct Cargo{
		uint sku;
		address sellerID;
		uint price;
		string cargoDetails;
	}

	//adding cargo for initial use
    function createCargo(
		uint _sku, 
		address _sellerID, 
		uint _price, 
		string memory _cargoDetails) 
		public {
		Cargo.sku = _sku;
		Cargo.sellerID = _sellerID;
		Cargo.price = _price;
		Cargo.cargoDetails = _cargoDetails;
	}

	//1st thing in supplychain
	function createOrder() public{
		address sellerID;
		
	}

	//function that will be used when changing ownership
	function moveCargo() public {

	}

	//function that allows customs to approve or deny the cargo
	function customsApproval() public{

	}

	//function for the buyer to approve of the product
	function buyerConfirmation() public {

	}
}