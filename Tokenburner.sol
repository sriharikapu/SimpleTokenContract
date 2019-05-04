pragma solidity ^0.4.6;


contract Tokenburner {
    address public owner;
    
    
  function create(address _beneficiary) payable{
    uint256 amount = msg.value;
    /// your logic
  }
    modifier onlyOwner() {
        if(msg.sender == owner){
        _;    
        }
        
    }

    function initWallet(address _owner) {
        owner = _owner;
    }

    function changeOwner(address _newOwner) external {
        if (msg.sender == owner) {
            owner = _newOwner;
        }
    }

    function withdraw(uint amount) external returns (bool success) {
        if (msg.sender == owner) {
            return owner.send(amount);
        } else {
            return false;
        }
    }

    function kill() onlyOwner() {
        selfdestruct(owner);
    }

    function () payable {}
}
