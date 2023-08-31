// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SendWithdrawMoney {
    // 스마트 컨트랙트의 현재 잔액을 저장하는 변수
    uint public balanceReceived;

    // 이더를 입금하는 함수
    function deposit() public payable {
        // msg.value는 받은 이더의 양을 나타냄
        // 받은 이더를 balanceReceived에 추가
        balanceReceived += msg.value;
    }

    // 스마트 컨트랙트의 잔액을 조회하는 함수
    function getContractBalance() public view returns(uint) {
        // address(this).balance는 컨트랙트의 잔액을 나타냄
        return address(this).balance;
    }

    // 모든 잔액을 출금하는 함수
    function withdrawAll() public {
        // msg.sender는 함수를 호출한 주소 (사용자의 주소)
        address payable to = payable(msg.sender);
        // to.transfer를 통해 모든 잔액을 to 주소로 전송
        to.transfer(getContractBalance());
    }

    // 특정 주소로 잔액을 출금하는 함수
    function withdrawToAddress(address payable to) public {
        // 특정 주소로 모든 잔액을 전송
        to.transfer(getContractBalance());
    }
}
