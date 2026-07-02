// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // --- Struct Candidate ---
    // Struct lưu thông tin của một ứng viên
    struct Candidate {
        string name;       // Tên ứng viên
        uint voteCount;    // Số phiếu nhận được
    }

    // --- Mapping ---
    // candidates: key là uint (ID ứng viên), value là struct Candidate
    mapping(uint => Candidate) public candidates;
    // hasVoted: key là address (ví người dùng), value là bool (đã vote chưa)
    mapping(address => bool) public hasVoted;

    // --- Owner & Counter ---
    // owner: người deploy contract, có quyền thêm ứng viên
    address public owner;
    // totalCandidates: đếm số lượng ứng viên đã thêm
    uint public totalCandidates;

    // --- Event ---
    // Event Voted được emit mỗi khi có người vote thành công
    // indexed: cho phép filter event theo địa chỉ voter
    event Voted(address indexed voter, uint candidateId);

    // --- Modifier onlyOwner ---
    // Kiểm tra msg.sender có phải owner không, nếu không thì revert
    // Dấu _; là vị trí code của hàm được chèn vào
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // --- Constructor ---
    // Gán owner = msg.sender tại thời điểm deploy
    constructor() {
        owner = msg.sender;
    }

    // --- addCandidate ---
    // onlyOwner: chỉ owner mới được thêm ứng viên mới
    // Tăng totalCandidates, gán ID = totalCandidates, voteCount khởi tạo = 0
    function addCandidate(string memory name) external onlyOwner {
        totalCandidates++;
        candidates[totalCandidates] = Candidate(name, 0);
    }

    // --- vote ---
    // Kiểm tra candidateId hợp lệ (tồn tại trong danh sách)
    // Kiểm tra msg.sender chưa vote (hasVoted == false)
    // Đánh dấu đã vote, tăng voteCount, emit event
    function vote(uint candidateId) external {
        require(candidateId > 0 && candidateId <= totalCandidates, "Invalid candidate");
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit Voted(msg.sender, candidateId);
    }

    // --- getCandidate ---
    // view: trả về thông tin ứng viên theo ID
    function getCandidate(uint candidateId) external view returns (Candidate memory) {
        return candidates[candidateId];
    }

    // --- getTotalCandidates ---
    // view: trả về tổng số ứng viên
    function getTotalCandidates() external view returns (uint) {
        return totalCandidates;
    }
}
