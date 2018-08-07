pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna); // 사용자의 행동에 대한 피드백

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits; // 10의 danDigits 승

    struct Zombie { // struct 선언
        string name;
        uint dna;
    }

    Zombie[] public zombies; // struct type dynamic size

	// '_' is 관례상
    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
