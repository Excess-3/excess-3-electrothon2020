pragma solidity  ^0.5.16;

library ConvertLib{
    function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
    {
        return amount * conversionRate;
    }
}
