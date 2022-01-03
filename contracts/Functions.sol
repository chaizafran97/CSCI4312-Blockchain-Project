// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

enum State{
	OrderCreated,			//0
	PassedToLocalCustoms,	//1
	Shipping,				//2
	Delivered				//3
}

struct Cargo{
	uint sku; //can be used as ID too
	address sellerID;
	address buyerID;
	string buyerAddress;
	string cargoDetails;
	uint price;
	State cargoState;
}

//1st thing in supplychain
function createOrder(){
    address sellerID;
    
}

//function that will be used when changing ownership
function moveCargo(){

}

//function that allows customs to approve or deny the cargo
function customsApproval(){

}

//function for the buyer to approve of the product
function buyerConfirmation(){

}