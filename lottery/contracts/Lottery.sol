pragma solidity >=0.7.0 <0.9.0;

contract  Lottery{
    
    address public manager;
    address [] public players;
    
    function Lottery1() public{
        manager=msg.sender;
       
    }
    
    function enter() public payable{
        require(msg.value> .01 ether);
        
        (players).push(msg.sender);
        
    }
    
    
    function random() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp,players)));
    
    }
    
    
    function  pickAWinner() public restricted {
            uint index = random() % players.length;
            payable(players[index]).transfer(address(this).balance);

            players = new address[](0);
        
        
    }
    
    modifier restricted(){
     require (msg.sender == manager);
   // require(address(this).balance>= 1 ether);
     _;

    }
    
    function getPlayers() public view returns (address[] memory){
        return players;
        
        
    }
   // function pickWinner() public winner returns 
    //{}
    
}
