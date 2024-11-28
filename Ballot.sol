// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ballot {
    struct Voter {
        uint256 weight; // Changed uint to uint256 for clarity and best practices
        bool voted;
        uint256 vote; // Changed uint8 to uint256 for compatibility
        address delegate;
    }
    
    struct Proposal {
        uint256 voteCount; // Changed uint to uint256 for clarity and best practices
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    /// Create a new ballot with `numProposals` different proposals.
    constructor(uint256 numProposals) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        // Initialize the proposals array with the specified number of proposals
        for (uint256 i = 0; i < numProposals; i++) {
            proposals.push(Proposal({voteCount: 0}));
        }
    }

    /// Give `toVoter` the right to vote on this ballot.
    /// May only be called by `chairperson`.
    function giveRightToVote(address toVoter) public {
        require(msg.sender == chairperson, "Only chairperson can give right to vote.");
        require(!voters[toVoter].voted, "The voter has already voted.");
        require(voters[toVoter].weight == 0, "The voter already has the right to vote.");

        voters[toVoter].weight = 1;
    }

    /// Delegate your vote to the voter `to`.
    function delegate(address to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You have already voted.");
        require(to != msg.sender, "Self-delegation is not allowed.");

        // Loop to find the final delegate
        while (voters[to].delegate != address(0)) {
            to = voters[to].delegate;

            // Prevent cycles in delegation
            require(to != msg.sender, "Found a delegation loop.");
        }

        sender.voted = true;
        sender.delegate = to;

        Voter storage delegateTo = voters[to];
        if (delegateTo.voted) {
            // If the delegate already voted, add to the proposal's vote count
            proposals[delegateTo.vote].voteCount += sender.weight;
        } else {
            // If the delegate did not vote yet, add weight to their vote
            delegateTo.weight += sender.weight;
        }
    }

    /// Give a single vote to proposal `toProposal`.
    function vote(uint256 toProposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You have already voted.");
        require(toProposal < proposals.length, "Invalid proposal.");

        sender.voted = true;
        sender.vote = toProposal;

        // Add weight to the proposal's vote count
        proposals[toProposal].voteCount += sender.weight;
    }

    /// Compute the winning proposal taking all previous votes into account.
    function winningProposal() public view returns (uint256 _winningProposal) {
        uint256 winningVoteCount = 0;

        for (uint256 prop = 0; prop < proposals.length; prop++) {
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
    }
}
