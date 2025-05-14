// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {AddressLinkedList} from "../contracts/utils/AddressLinkedList.sol";
import {Bytes32LinkedList} from "../contracts/utils/Bytes32LinkedList.sol";
import {SelectorLinkedList} from "../contracts/utils/SelectorLinkedList.sol";

contract LinkedListDemo {
    using AddressLinkedList for mapping(address => address);
    using Bytes32LinkedList for mapping(bytes32 => bytes32);
    using SelectorLinkedList for mapping(bytes4 => bytes4);

    mapping(address => address) private _addressList;
    mapping(bytes32 => bytes32) private _bytes32List;
    mapping(bytes4 => bytes4) private _selectorList;

    function addAddress(address addr) public {
        _addressList.add(addr);
    }

    function removeAddress(address addr) public {
        _addressList.remove(addr);
    }

    function isExistAddress(address addr) public view returns (bool) {
        return _addressList.isExist(addr);
    }

    function addressListSize() public view returns (uint256) {
        return _addressList.size();
    }

    function clearAddressList() public {
        _addressList.clear();
    }

    function addBytes32(bytes32 data) public {
        _bytes32List.add(data);
    }

    function removeBytes32(bytes32 data) public {
        _bytes32List.remove(data);
    }

    function isExistBytes32(bytes32 data) public view returns (bool) {
        return _bytes32List.isExist(data);
    }

    function clearBytes32List() public {
        _bytes32List.clear();
    }

    function bytes32ListSize() public view returns (uint256) {
        return _bytes32List.size();
    }

    function addBytes4(bytes4 selector) public {
        _selectorList.add(selector);
    }

    function addBytes4(bytes4[] memory selectors) public {
        _selectorList.add(selectors);
    }

    function removeBytes4(bytes4 selector) public {
        _selectorList.remove(selector);
    }

    function isExistBytes4(bytes4 selector) public view returns (bool) {
        return _selectorList.isExist(selector);
    }

    function clearBytes4() public {
        _selectorList.clear();
    }

    function bytes4ListSize() public view returns (uint256) {
        return _selectorList.size();
    }
}

contract LinkedListTest is Test {
    LinkedListDemo demo;

    function setUp() public {
        demo = new LinkedListDemo();
    }

    error INVALID_SELECTOR();
    error SELECTOR_ALREADY_EXISTS();
    error SELECTOR_NOT_EXISTS();

    function test_selectorLinkedList() public {
        assertEq(demo.bytes4ListSize(), 0);

        vm.expectRevert(INVALID_SELECTOR.selector);
        demo.addBytes4(0x00000000);
        vm.expectRevert(INVALID_SELECTOR.selector);
        demo.addBytes4(0x00000001);

        assertEq(demo.bytes4ListSize(), 0);

        demo.addBytes4(0x00000003);
        demo.addBytes4(0x00000002);
        assertEq(demo.bytes4ListSize(), 2);
        demo.clearBytes4();
        assertFalse(demo.isExistBytes4(0x00000003));
        assertFalse(demo.isExistBytes4(0x00000002));

        assertEq(demo.bytes4ListSize(), 0);
        demo.addBytes4(0x00000003);
        demo.addBytes4(0x00000002);
        demo.addBytes4(0x00000004);
        demo.removeBytes4(0x00000002);
        assertTrue(demo.isExistBytes4(0x00000003));
        assertFalse(demo.isExistBytes4(0x00000002));
        assertTrue(demo.isExistBytes4(0x00000004));
        assertEq(demo.bytes4ListSize(), 2);
        demo.clearBytes4();
        assertEq(demo.bytes4ListSize(), 0);
        bytes4[] memory selectors = new bytes4[](2);
        selectors[0] = 0x00000003;
        selectors[1] = 0x00000002;
        demo.addBytes4(selectors);
        assertEq(demo.bytes4ListSize(), 2);
        assertTrue(demo.isExistBytes4(0x00000003));
        assertTrue(demo.isExistBytes4(0x00000002));
        assertFalse(demo.isExistBytes4(0x00000004));
    }

    error INVALID_ADDRESS();
    error ADDRESS_ALREADY_EXISTS();
    error ADDRESS_NOT_EXISTS();

    function test_addressLinkedList() public {
        assertEq(demo.addressListSize(), 0);

        vm.expectRevert(INVALID_ADDRESS.selector);
        demo.addAddress(address(0));
        vm.expectRevert(INVALID_ADDRESS.selector);
        demo.addAddress(address(1));

        assertEq(demo.addressListSize(), 0);

        demo.addAddress(address(3));
        demo.addAddress(address(2));
        assertEq(demo.addressListSize(), 2);
        demo.clearAddressList();
        assertEq(demo.addressListSize(), 0);
        demo.addAddress(address(3));
        demo.addAddress(address(2));
        assertEq(demo.addressListSize(), 2);
        assertTrue(demo.isExistAddress(address(3)));
        assertTrue(demo.isExistAddress(address(2)));
        assertFalse(demo.isExistAddress(address(4)));
    }

    error INVALID_DATA();
    error DATA_ALREADY_EXISTS();
    error DATA_NOT_EXISTS();

    function test_bytes32LinkedList() public {
        assertEq(demo.bytes32ListSize(), 0);

        bytes32 _1 = 0x0000000000000000000000000000000000000000000000000000000000000001;
        bytes32 _2 = 0x0000000000000000000000000000000000000000000000000000000000000002;
        bytes32 _3 = 0x0000000000000000000000000000000000000000000000000000000000000003;

        vm.expectRevert(INVALID_DATA.selector);
        demo.addBytes32(bytes32(0));
        vm.expectRevert(INVALID_DATA.selector);
        demo.addBytes32(_1);

        assertEq(demo.bytes32ListSize(), 0);

        demo.addBytes32(_3);
        demo.addBytes32(_2);
        assertEq(demo.bytes32ListSize(), 2);
        demo.clearBytes32List();
        assertEq(demo.bytes32ListSize(), 0);
        demo.addBytes32(_3);
        demo.addBytes32(_2);
        assertEq(demo.bytes32ListSize(), 2);
        assertTrue(demo.isExistBytes32(_3));
        assertTrue(demo.isExistBytes32(_2));
        assertFalse(demo.isExistBytes32(keccak256("")));
    }
}
