const SupplyChain = artifacts.require("SupplyChain");

contract('SupplyChain', () =>{
    
    //tests with mocha
    cargoPrice = 600;
    cargoDetails = 'Graphics Card';
    cargoLocation = 'USA';
    buyer = '';

    it('Testing whether cargo has been initialized', async()=>{
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.initializeCargo(cargoPrice, cargoDetails, cargoLocation, buyer);
        const viewCargo = await supplyChain.viewCargo.call(0);
        assert.equal(viewCargo[1], cargoPrice);
        assert.equal(viewCargo[2], cargoDetails);
        assert.equal(viewCargo[3], cargoLocation);
});
    buyer = 'Adam'

    it('Buyer should be named Adam', async () => {
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.cargoBought(0, buyer);
        const viewCargo = await supplyChain.viewCargo.call(0);
        assert.equal(viewCargo[4], buyer);
    });

    //tests with chai
    it('Check if cargo is approved by customs', async()=>{
        const supplyChain = await SupplyChain.deployed();
        approval = 'Y';
        await supplyChain.customsCheck(0, approval);
        const customsCheck = await supplyChain.customsCheck.call(0, approval);
        expect(customsCheck).to.equal('Customs approved, you can proceed with shipping');
    });

    it('Check if cargo is denied by customs', async()=>{
        const supplyChain = await SupplyChain.deployed();
        approval = 'N';
        await supplyChain.customsCheck(0, approval);
        const customsCheck = await supplyChain.customsCheck.call(0, approval);
        expect(customsCheck).to.equal('Order was denied by customs');
    });

    it('Check if cargo has been shipped', async()=>{
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.cargoShipping(0);
        const viewCargo = await supplyChain.viewCargo.call(0);
        expect(viewCargo[5]).to.equal('Order currently shipping');
    });

    it('Check if cargo has been received', async()=>{
        const supplyChain = await SupplyChain.deployed();
        await supplyChain.cargoReceieved(0);
        const viewCargo = await supplyChain.viewCargo.call(0);
        expect(viewCargo[5]).to.equal('Buyer has received');
    });
});
