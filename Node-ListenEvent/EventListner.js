const ethers = require("ethers");
const walletABI = require("./contractABI/walletList.json");
require("dotenv").config();

async function main() {
  const contractAddress = "0x7BC56F8aD67e60b13878D27B74F344e44E71A021";
  const provider = new ethers.WebSocketProvider(
    process.env.ALCHEMY_WEBSOCKET_KEY
  );

  const contract = new ethers.Contract(contractAddress, walletABI, provider);

  contract.on("WalletAdded", async (wallet) => {
    try {
      console.log("Event Listner Start");
      let walletEvent = {
        wallet: wallet,
      };
      console.table([walletEvent]);
    } catch (error) {
      console.log(error);
    }
  });
}
main();
