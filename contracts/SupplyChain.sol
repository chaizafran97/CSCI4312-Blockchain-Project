// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SupplyChain{

	address cargoAddress;
	mapping(address => uint256) private currentOwner;
	uint256 sku;
	string sellerID;
	uint256 price;
	string cargoDetails;
	State cargoState;

	enum State{
		WithSeller,				//0
		OrderCreated,			//1
		PassedToLocalCustoms,	//2
		Shipping,				//3
		Delivered				//4
	}

	struct Cargo{
		uint256 sku;
		string sellerID;
		uint256 price;
		string cargoDetails;
		State cargoState;
		string buyer;
	}

	Cargo[] public cargo;
	mapping(uint256 => string) public cargoToOwner;

	//adding cargo for initial use
    function createCargo(
		uint256 _sku,
		string memory _sellerID,
		uint256 _price,
		string memory _cargoDetails
	) public {
		sku = _sku;
		sellerID = _sellerID;
		price = _price;
		cargoDetails = _cargoDetails;
		cargoState = State.WithSeller;
	}

	//Order Created
	function createOrder(uint256 _sku, string memory _buyer) public{
		cargo[_sku].cargoState = State.OrderCreated;
		cargo.push(Cargo.buyer(_buyer));

	}

	//function that will be used when passed to courier
	function moveCargoToCourier(uint256 _sku) public {
		cargo[_sku].cargoState = State.Shipping;
	}

	//function that will be used when passed to courier
	function moveCargoToCustoms(uint256 _sku) public {
		cargo[_sku].cargoState = State.PassedToLocalCustoms;
	}

	//function that will be used when passed to courier
	function moveCargoToBuyer(uint256 _sku) public {
		cargo[_sku].cargoState = State.Delivered;
	}
	    
    function hasSellerRole( address _account) public view returns (bool){
        require(_account != address(0));
        return Role[_account].seller;
    }

    function hasBuyerRole( address _account) public view returns (bool){
        require(_account != address(1));
        return Role[_account].buyer;
    }

    function hasCourierRole( address _account) public view returns (bool){
        require(_account != address(2));
        return Role[_account].courier;
    }

    function hasCustomsRole( address _account) public view returns (bool){
        require(_account != address(3));
        return Role[_account].customs;
    }
}