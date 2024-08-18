const contractAddress = '0xda58Bc74cC49cd4AA81A74b3670Ed25C2ACf2Cc2';
const contractABI = ['..\[build\contracts\Product.json'];
let userContract;

window.addEventListener('load', async () => {
    if (window.ethereum) {
        window.web3 = new Web3(ethereum);
        try {
            await ethereum.enable();
            initContract();
        } catch (error) {
            console.error("User denied account access");
        }
    } else if (window.web3) {
        window.web3 = new Web3(web3.currentProvider);
        initContract();
    } else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
    }
});

function initContract() {
    userContract = new web3.eth.Contract(contractABI, contractAddress);
}

document.getElementById('registerForm').addEventListener('submit', async (event) => {
    event.preventDefault();
    const accounts = await web3.eth.getAccounts();
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const userAddress = document.getElementById('userAddress').value;
    const dob = document.getElementById('dob').value;
    const gender = document.getElementById('gender').value;
    const roleId = document.getElementById('roleId').value;
    const regionId = document.getElementById('regionId').value;

    userContract.methods.addUser(name, email, userAddress, dob, gender, roleId, regionId)
        .send({ from: accounts[0] })
        .on('receipt', (receipt) => {
            console.log('User registered:', receipt);
        })
        .on('error', (error) => {
            console.error('Error registering user:', error);
        });
});