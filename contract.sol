pragma solidity ^0.4.0;
contract TimeStampDocument {
    mapping(bytes32 => bool) public usedHashes;
    mapping(bytes32 => uint) public hashTimestamp;

    function addHash(bytes32 hash) public{
        usedHashes[hash] = true;
        hashTimestamp[hash] = block.timestamp;
    }
    
    function documentExists(bytes32 hash) public view returns(bool){
        if (usedHashes[hash] == true){
            return true;
        }
        return false;
    }
    
    function getTimeStamp(bytes32 hash) public view returns(uint){
        if (documentExists(hash)){
            return hashTimestamp[hash];
        }
        return 0;
    }
}
