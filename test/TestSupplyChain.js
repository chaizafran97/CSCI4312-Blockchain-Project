const SupplyChain = artifacts.require("SupplyChain");

contract("SupplyChain", initializeCargo =>{
    
    cargoPrice = 600;
    cargoDetails = 'Graphics Card';
    cargoLocation = 'USA';
    buyer = '';

    it("Testing whether cargo has been initialized", async()=>{
        assert.equal(cargoPrice, 600);
        assert.equal(cargoDetails, 'Graphics Card');
        assert.equal(cargoLocation, 'USA');
});
    buyer = 'Adam'

    SupplyChain.cargoBought.call(0, buyer);

    it("Testing whether buyer name is there when cargo has been bought", async()=>{
        
        assert.equal(buyer, 'Adam');
    });
});
