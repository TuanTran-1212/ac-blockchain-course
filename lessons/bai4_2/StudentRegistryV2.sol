// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistryV2 {
    // --- Struct ---
    // Struct là kiểu dữ liệu do người dùng tự định nghĩa
    struct Student {
        string name;        // Tên sinh viên
        uint age;           // Tuổi
        bool isRegistered;  // Trạng thái đăng ký
    }

    // --- Mapping ---
    // Lưu thông tin Student theo địa chỉ ví
    mapping(address => Student) private students;

    // --- Owner ---
    // Biến public lưu địa chỉ người deploy contract
    // Gán một lần duy nhất trong constructor
    address public owner;

    // --- Event ---
    // Event ghi log ra ngoài blockchain, có thể quan sát trong Remix IDE
    // indexed: trường được đánh index, cho phép filter khi tìm kiếm event
    event StudentRegistered(address indexed student, string name, uint age);

    // --- Modifier ---
    // Modifier kiểm tra điều kiện trước khi chạy body của hàm
    // onlyOwner: nếu msg.sender không phải owner thì hàm sẽ revert
    // Dấu _; là vị trí code của hàm gốc được chèn vào
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // --- Constructor ---
    // Chạy một lần khi contract được deploy
    // msg.sender tại thời điểm deploy là người triển khai → owner
    constructor() {
        owner = msg.sender;
    }

    // --- registerStudent ---
    // onlyOwner: chỉ owner mới có quyền gọi
    // emit: phát event ra ngoài blockchain
    function registerStudent(string memory name, uint age) external onlyOwner {
        students[msg.sender] = Student(name, age, true);
        emit StudentRegistered(msg.sender, name, age);
    }

    // --- getStudent ---
    // view: không thay đổi state
    function getStudent(address user) external view returns (Student memory) {
        return students[user];
    }

    // --- isStudentRegistered ---
    function isStudentRegistered(address user) external view returns (bool) {
        return students[user].isRegistered;
    }
}
