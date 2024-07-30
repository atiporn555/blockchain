// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract tips {
    address owner;
    constructor(){
        owner = msg.sender;
    }

    //1. ใส่เงินเข้าไปในกระปุก

    function addtips() payable public {
        
        
    }

    //2. เช็คว่ามีเงินในกระปุกเท่าไหร่

    function viewtips() public view returns (uint){
        return address(this).balance;
    }

    
    
    
    //3. แอด userคือเพิ่มคนที่จะได้รับติ้บ
    //4. ลบ user
    //5. ดู user
    //6. จ่ายเงิน
} 