# Welcome to my Ballot Project.

## Prerequisites
 # Change the Network to Sepolia Testnet

Go to [Sepolia Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia).

- Paste the wallet address and receive **0.05 ETH per day**.
- You should see **0.05 ETH deposited** into your wallet.

### Optional: Mining Testnet ETH

If developing a complex program, you can mine testnet ETH.

1. Go to [Passport](https://app.passport.xyz/#/).
2. Sign in with Ethereum using MetaMask.
3. Ensure you have at least **2 Unique Humanity Score**:
   - Link your LinkedIn and Google accounts under **Social & Professional Platforms**.
4. With a Unique Humanity Score of 2.1, proceed to mining.

- Visit [Sepolia Mining Tool](https://sepolia-faucet.pk910.de/#/).
- Paste your wallet address, complete the captcha, and start mining.

#### Notes:
- Mining rate depends on your PC’s configuration. Close other heavy applications for better efficiency.
- Minimum **0.05 ETH** is needed to withdraw; a maximum of **2.5 ETH** can be mined per session.
- After 2.5 ETH, the mining session ends. Click "Claim Reward" to confirm the transaction.

### Compile and Deploy the Smart Contract

1. Compile `ballot.sol` in **Solidity version 0.8.0**.
2. Deploy the smart contract on Sepolia Testnet in **Injected Provider - MetaMask** environment.

### Managing Accounts and Transactions

- Create accounts for Alice, Bob, and Charlie.
- Assign **Account 1** (used for deployment) as the Chairperson.
- Transfer ETH to newly created wallets:
  - 0.01 ETH is sufficient per wallet for this task.
- Configure transaction mining time:
  - Aggressive mining may require 0-2 GWEI extra; base fee is 5 GWEI.
  - Avoid pressing "Speed Up" while a transaction is pending.

### Interacting with the Smart Contract

1. **Assign Voting Rights:**
   - Copy Alice’s wallet address and assign voting rights using Account 1 (Chairperson).
   - Repeat for Bob and Charlie.

2. **Proposal Votes:**
   - Use the `Proposal` function to view the number of votes received by a proposal.
   - Proposals are stored in an array:
     - Example: For 3 proposals, index 0 is proposal 1, index 1 is proposal 2, and index 2 is proposal 3.

3. **Voter Status:**
   - Use the `Voters` function to check the voting status of a wallet.

4. **Delegating Votes:**
   - Delegate Alice’s vote to Bob by pasting Bob’s address and confirming the transaction with Alice's wallet active.
   - Verify:
     - Bob’s vote weight increases to 2.
     - Alice’s status changes to "voted."

5. **Voting:**
   - Chairperson votes for proposal 2 (index 1).
   - Bob votes for proposal 2 (index 1).
   - Charlie votes for proposal 3 (index 2).

### Results

- **Proposal index 0**: 0 votes.
- **Proposal index 1**: 3 votes.
- **Proposal index 2**: 1 vote.
- **Winning Proposal**: Proposal 2 (index 1).


### For more vidualization please refer to the [Project Documenation](https://github.com/Salekin-Nabil/Blockchain-Based-Ballot/blob/main/Week%2013%20Homework%201_CS572_Nabil_Shirajus_Salekin_19889.pdf)