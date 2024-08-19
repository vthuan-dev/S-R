document.addEventListener('DOMContentLoaded', async () => {
    if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
        try {
            await window.ethereum.enable(); // Request account access
            console.log("Connected to MetaMask");
        } catch (error) {
            console.error("User denied account access");
        }
    } else if (window.web3) { // Legacy dapp browsers...
        window.web3 = new Web3(web3.currentProvider);
        console.log("Connected to web3 provider");
    } else {
        console.log("Non-Ethereum browser detected. You should consider trying MetaMask!");
    }

    const contractABI = [ ; 
    const contractAddress = '0xYourContractAddress'; 
    const userContract = new web3.eth.Contract(contractABI, contractAddress);

    document.getElementById('registerForm').onsubmit = async function(event) {
        event.preventDefault();

        const accounts = await web3.eth.getAccounts();
        const account = accounts[0];

        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const userAddress = document.getElementById('userAddress').value;
        const dob = document.getElementById('dob').value;
        const gender = document.getElementById('gender').value;
        const roleId = document.getElementById('roleId').value;
        const regionId = document.getElementById('regionId').value;

        try {
            await userContract.methods.addUser(name, email, userAddress, dob, gender, roleId, regionId)
            .send({ from: account });

            alert("User registered successfully!");
        } catch (error) {
            console.error("Error registering user:", error);
            alert("Failed to register user.");
        }
    };
});
