// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract tips {

    address owner;
    Waitress[] waitress;
    
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

    
    
    //3. add structure waitress คือเพิ่มคนที่จะได้รับติ้บ
            struct Waitress{
                address payable walletAddress;
                string name;
            }

    //3.2 add waitress
    function addWaitress(address payable walletAddress,string memory name) public {
        require(msg.sender == owner, "Only the owner can call this function");
        bool waitressExist = false;

        if (waitress.length >=1){
             for(uint i=0; i<waitress.length; i++){
           if(waitress[i].walletAddress == walletAddress)
           waitressExist = true;

        }
       
        }
  
        

        if(waitressExist==false){
            waitress.push(Waitress(walletAddress,name));
        }
    }
 //4. ลบ user
        function removeWaitress(address payable walletAddress) public {
            if(waitress.length>=1){
                for(uint i=0; i<waitress.length; i++){
                    if(waitress[1].walletAddress==walletAddress){
                        for(uint j=i; j<waitress.length-1; j++){
                            waitress[j]=waitress[j+1];
                        }
                        waitress.pop();
                        break;
                    }
                }
            }
        }
    

    //5. ดู waitress
    function viewWaitress() public view returns (Waitress[] memory) {
        return waitress; 
    }

     //6. จ่ายเงิน
     function distrubiteTips() public {
        require(address(this).balance > 0, "Insufficient balance in the contract");
        if(waitress.length>=1){
            uint amount = address(this).balance / waitress.length;
            for(uint i=0; i<waitress.length; i++){
                transfer(waitress[i].walletAddress,amount);
            }
        }
     }
     // transfer money
        function transfer(address payable walletAddress, uint amount) internal {
            walletAddress.transfer(amount);
        }
     } 