pragma solidity >=0.5.0;

//defines the role of users in the blockchain
struct Role{
	string name;
	string company;
	string role;
	mapping (address => bool) bearer;
}