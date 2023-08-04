const deploy = async () => {
  const [deployer] = await ethers.getSigners();

  console.log("Deployin contract with the account: ", deployer.address);

  const CryptoPunks = await ethers.getContractFactory("CryptoPunks");
  const deployed = await CryptoPunks.deploy();

  console.log("Crypto Punks is deployed at: ");
};

deploy()
  .then(() => process.exit(0))
  .catch(() => {
    console.log(error);
    process.exit(1);
  });
