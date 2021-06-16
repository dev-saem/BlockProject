const {
    web3
  } = window
  const selectedAddress = web3.eth.defaultAccount
  
  $(document).ready(function () {
     const userRegistryContractAddress = '0x77191E84eD11d5dd3c9646F49b3F0Ec4AbFfaf18';
     const userRegistryContractABI = [
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_initNumber",
                    "type": "uint256"
                },
                {
                    "name": "_hhuman",
                    "type": "string"
                },
                {
                    "name": "_hcontent",
                    "type": "string"
                }
            ],
            "name": "addHumans",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "killContract",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getAllHumans",
            "outputs": [
                {
                    "components": [
                        {
                            "name": "number",
                            "type": "uint256"
                        },
                        {
                            "name": "hhuman",
                            "type": "string"
                        },
                        {
                            "name": "hcontent",
                            "type": "string"
                        },
                        {
                            "name": "timestamp",
                            "type": "uint256"
                        }
                    ],
                    "name": "",
                    "type": "tuple[]"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_index",
                    "type": "uint256"
                }
            ],
            "name": "getHumans",
            "outputs": [
                {
                    "name": "",
                    "type": "uint256"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getNumOfHumans",
            "outputs": [
                {
                    "name": "",
                    "type": "uint8"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "",
                    "type": "uint256"
                }
            ],
            "name": "humans",
            "outputs": [
                {
                    "name": "number",
                    "type": "uint256"
                },
                {
                    "name": "hhuman",
                    "type": "string"
                },
                {
                    "name": "hcontent",
                    "type": "string"
                },
                {
                    "name": "timestamp",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        }
    ]
  
    
    $('#uploadbutton').click(uploadbutton);
    $('#showTableButton').click(showTable);
  
    $('#contractLink').text(userRegistryContractAddress);
    $('#contractLink').attr('href', 'https://ropsten.etherscan.io/address/' + userRegistryContractAddress);
  
    // Attach AJAX "loading" event listener
    $(document).on({
        ajaxStart: function () {
            $("#loadingBox").show()
        },
        ajaxStop: function () {
            $("#loadingBox").hide()
        }
    });
  
  
    function showInfo(message) {
        $('#infoBox>p').html(message);
        $('#infoBox').show();
        $('#infoBox>header').click(function () {
            $('#infoBox').hide();
        });
    }
  
    function showError(errorMsg) {
        $('#errorBox>p').html("Error: " + errorMsg);
        $('#errorBox').show();
        $('#errorBox>header').click(function () {
            $('#errorBox').hide();
        });
    }
  
  
    async function showTable() {
        // $('#viewSubmitDocument>table').html( );
        // $('#viewSubmitDocument').show();
  
        if (window.ethereum)
            try {
                await window.ethereum.enable();
            } catch (err) {
                return showError("Access to your Ethereum account rejected.");
            }
        if (typeof web3 === 'undefined')
            return showError("Please install MetaMask to access the Ethereum Web3 injected API from your Web browser.");
  
  
        let contract = web3.eth.contract(userRegistryContractABI).at(userRegistryContractAddress);
  
        $('#notificationTable').append(  '<table>' );
  
        contract.getNumOfHumans(function (err, result) {
            if (err)
                return showError("Smart contract call failed: " + err);
  
  
            // showInfo(`Document ${result} <b>successfully added</b> to the registry.`);
            console.log("length: " + result);
  
            for (let i = 0; i < result; i++) {
  
                contract.getHumans(i, function (err, user) {
  
                    console.log("user: " + user);
  
                    let toString = user.toString();
                    // console.log("product: " + toString);
                    let strArray = toString.split(",");
  
                    let timestamp = new Date(strArray[3] * 1000);
                    console.log("timestamp: " + timestamp);
                    console.log("timestamp: " + strArray[3] * 1000);
  
                    // let row = table.insertRow();
                    // let cell1 = row.insertCell(0);
                    // let cell2 = row.insertCell(1);
                    // let cell3 = row.insertCell(2);
                    // let cell4 = row.insertCell(3);
                    // cell1.innerHTML = strArray[0];
                    // cell2.innerHTML = strArray[1];
                    // cell3.innerHTML = strArray[2];
                    // cell4.style.width ="60%";
                    // cell4.innerHTML = timestamp;
  
                    $('#notificationTable').append( '<tr><td>' + strArray[0] + ", "+ strArray[1] + ", "+ strArray[2] + ", "+ timestamp  + '</td></tr>' );
  
                }) // end of get
  
            } // end of for
  
        });
  
        // for(i=0;i<3;i++){
        // 	$('#myTable').append( '<tr><td>' + 'result' +  i + '</td></tr>' );
        // 
  
        $('#notificationTable').append(  '</table>' );
    }
  
  
  
    async function uploadbutton() {
        if (window.ethereum)
            try {
                await window.ethereum.enable();
            } catch (err) {
                return showError("Access to your Ethereum account rejected")
            }
        if (typeof web3 === 'undefined')
            return showError("Please install MetaMask to access the Ethereum Web3 injected API from your Web browser.");
  
        let account = selectedAddress
        console.log("my account", account);
  
        let WhatName = $('#hhuman').val();
        console.log("WhatName ", WhatName);
  
        let WhatContent = $('#content').val();
        console.log("WhatContent ", WhatContent);
  
        let date = new Date();
        let mills = date.getMilliseconds();
  
        let contract = web3.eth.contract(userRegistryContractABI).at(userRegistryContractAddress);
  
        contract.addHumans(mills, WhatName, WhatContent, function (err, result) {
            if (err)
                return showError("Smart contract call failed: " + err);
            showInfo(`Document ${result} <b>successfully added</b> to the registry.`);
        });
    }
  });