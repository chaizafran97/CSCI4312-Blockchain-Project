const _deploy_contracts = require("../migrations/2_deploy_contracts");

var SupplyChain = artifacts.require('SupplyChain');

_deploy_contracts('SupplyChain', function(accounts){

    cargoPrice = 600;
    cargoDetails = 'Graphics Card';
    cargoLocation = 'USA';
    buyer = '';

    it("Testing whether cargo has been initialized", async()=>{

        assert.equal(cargoPrice, 600)
        assert.equal(cargoDetails, 'Graphics Card')
        assert.equal(cargoLocation, 'USA')
    });

});