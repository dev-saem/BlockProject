$(document).ready(function () { // 화면이 시작하자마자 그려짐
    let DEBUG = 1;

    const web3 = new Web3('https://ropsten.infura.io/v3/3c52917848e945229c0d33d632b10490');
    let Buffer = ethereumjs.Buffer.Buffer;
    let version = web3.version;

    if (DEBUG) {
        console.log('starting...');
        console.log("Ropsten Ethereum API version : ", version);
        console.log("web3: ", web3);
    }

    $('#itembuy').on('click', async function () {

        let useraddress = $("#useraddress").val();
        let toaddress = $("#toaddress").val();
        let amount = $("#sendcoin").val();
        let myPrivateKey = $("#passwd").val();

        const privateKey = Buffer.from(myPrivateKey, 'hex');
        if (DEBUG) console.log("privateKey: ", privateKey);

        web3.eth.getTransactionCount(useraddress, (err, txCount) => {
        // Build the transaction
        const txObject = {
        nonce: web3.utils.toHex(txCount),
        to: toaddress,
        value: web3.utils.toHex(web3.utils.toWei(amount, 'ether')),
        gasLimit: web3.utils.toHex(21000),
        gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei'))
        }

        // Sign the transaction
        const tx = new ethereumjs.Tx(txObject);
        tx.sign(privateKey);

        const serializedTx = tx.serialize()
        const raw = '0x' + serializedTx.toString('hex')

        // Broadcast the transaction
        web3.eth.sendSignedTransaction(raw, (err, txHash) => {
        console.log('txHash:', txHash)
        // Now go check etherscan to see the transaction!
        })
        })  // end of txbuilder
    })

    $('#getBalance').on('click', async function () {
        let useraddress = $("#useraddress").val();
        
        let getbalance = await web3.eth.getBalance(useraddress);
        let balance = web3.utils.fromWei(getbalance, "ether")

        if (DEBUG) console.log("balance : ", balance + " ETH");
        $('#message').text(" balance: " + balance + " ETH");
    })
})