// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    // --- Struct ---
    // Struct là kiểu dữ liệu do người dùng tự định nghĩa, gồm nhiều trường
    struct Student {
        string name;        // Tên sinh viên
        uint age;           // Tuổi
        bool isRegistered;  // Trạng thái đăng ký: true/false
    }

    // --- Mapping ---
    // Mapping(address => Student): key là địa chỉ ví, value là struct Student
    // Giống như "từ điển" tra cứu thông tin theo địa chỉ
    mapping(address => Student) private students;

    // --- register ---
    // msg.sender: địa chỉ của người gọi hàm (người ký giao dịch)
    // memory: tham số string name được lưu tạm trong bộ nhớ (không phải storage)
    function register(string memory name, uint age) external {
        // Tạo struct Student mới và gán vào mapping tại key msg.sender
        // isRegistered được set = true ngay khi tạo struct
        students[msg.sender] = Student(name, age, true);
    }

    // --- getStudent ---
    // view: hàm chỉ đọc dữ liệu, không thay đổi state
    // returns (Student memory): trả về struct Student tạm trong bộ nhớ
    function getStudent(address user) external view returns (Student memory) {
        return students[user];
    }

    // --- isStudentRegistered ---
    // Trả về true/false dựa vào trường isRegistered trong struct
    function isStudentRegistered(address user) external view returns (bool) {
        return students[user].isRegistered;
    }
}
