const SupplyChain = artifacts.require("SupplyChain");

contract('SupplyChain', () =>{
    
    cargoPrice = 600;
    cargoDetails = 'Graphics Card';
    cargoLocation = 'USA';
    buyer = '';

    it('Testing whether cargo has been initialized', async()=>{
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.initializeCargo(cargoPrice, cargoDetails, cargoLocation, buyer);
        assert(cargoPrice === 600);
        assert(cargoDetails === 'Graphics Card');
        assert(cargoLocation === 'USA');
});
    buyer = 'Adam'

    it('Buyer should be named Adam', async () => {
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.cargoBought(0, buyer);
        assert(buyer === 'Adam');
    });
});
