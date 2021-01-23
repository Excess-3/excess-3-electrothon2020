pragma solidity >=0.7.0 <0.8.0;
contract Donation{
   struct Appealers{
       address payable adr;
       uint time;
       bool reg;
       uint asked;
       bool grant;
   } 
   mapping (uint=>Appealers) public appealers;
   event Appeal (address by,uint id);
    constructor() public{
        
    }
   function registeration(uint id) private
    {
        require(!(appealers[id].reg),"user registered");
         appealers[id].reg=true;
    }
    function appeal(uint id) public
    {
        if(appealers[id].reg==false)
        registeration(id);
        
            require(block.timestamp>appealers[id].time+20 seconds,"can appeal once in 20 seconds");
            appealers[id].asked++;
           uint t=block.timestamp;
             appealers[id].grant=false;
           appealers[id].adr=msg.sender;
           appealers[id].time=t;
         
            assert(appealers[id].time==t);
            emit Appeal(msg.sender,id);
    }
    function pay(uint id) payable  public
    {
        require(msg.sender!=appealers[id].adr,"cannot donate to yourself");
        require(appealers[id].reg==true,"user has not appealed");
        require(appealers[id].grant==false,"already granted");
        appealers[id].adr.transfer(msg.value);
        appealers[id].grant=true;
        assert(appealers[id].grant==true);
    }

}
