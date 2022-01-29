App = {  
    web3Provider: null,  
    contracts: {},  
    
    initWeb3: async function() {  
      // Modern dapp browsers...  
      if (window.ethereum) {  
        App.web3Provider = window.ethereum;  
        try {  
          // Request account access  
          await window.ethereum.enable();  
        } catch (error) {  
          // User denied account access...  
          console.error("User denied account access")  
        }  
      }  
      // Legacy dapp browsers...  
      else if (window.web3) {  
        App.web3Provider = window.web3.currentProvider;  
      }  
      // If no injected web3 instance is detected, fall back to Ganache  
      else {  
        App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');  
      }  
      // App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');  
      web3 = new Web3(App.web3Provider);  
    
      return App.initContract();  
    },  
    initContract: function(){
        $.getJSON('SupplyChain.json', function(data){
            App.contracts.SupplyChain = TruffleContract(data);
            App.contracts.SupplyChain.setProvider(App.web3Provider);
            return App.init();
        });
        return App.initializeCargoButton();

    },
    initializeCargoButton: function(){
        $(document).on('click', '.initializeCargo', App.initializeCargo);
    },
    initializeCargo:function(event){
        var name = document.getElementById('name').value
        var nameInstance;
        App.contracts.SupplyChain.deployed().then(function(instance){
            nameInstance = name;
            return nameInstance.SupplyChain(name);
        });
        console.log('Cargo Initialized');
    },
    
};