// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// execution cost (gas):
// 377874: constant + immutable
// 419883: none constant + none immutable
// 364662: inline minimumUSD
contract FundMe {
    // uint public constant minimumUSD = 0.1 * 10 ** 18;
    address payable immutable owner;
    address[] funders;
    mapping(address => uint256) funderToAmount;

    constructor() {
        owner = payable(msg.sender);
    }

    function fund() public payable {
        require(
            msg.value >=  0.1 * 10 ** 18,
            "should not be less than 0.1 ETH."
        );

        if (funderToAmount[msg.sender] == 0) {
            funders.push(msg.sender);
            funderToAmount[msg.sender] = msg.value;
        } else {
            funderToAmount[msg.sender] += msg.value;
        }
    }

    function withdraw() public onlyOwner {
        // we don't reset the funders and fundersToAmount since it will cost losts of gas
        // and keep them is good to know the total funds in the future.
        owner.transfer(address(this).balance);
    }

    function totalFunds() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < funders.length; i++) {
            total += funderToAmount[funders[i]];
        }
        return total;
    }

    function totalFundsDetails(address funder) public view returns (uint) {
        return funderToAmount[funder];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can withdraw");
        _;
    }
}
