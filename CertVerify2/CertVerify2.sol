// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CertVerify2 {
    struct Certificate {
        string id;
        string studentName;
        string course;
        string issueDate;
        address issuer;
        bool exists;
    }

    mapping(string => Certificate) private certificates;
    string[] public certificateIds;

    event CertificateIssued(string id, string studentName, string course, string issueDate, address issuer);

    function issueCertificate(
        string memory _id,
        string memory _studentName,
        string memory _course,
        string memory _issueDate
    ) public {
        require(!certificates[_id].exists, "Certificate ID already exists!");
        require(bytes(_id).length > 0, "ID cannot be empty!");
        require(bytes(_studentName).length > 0, "Name cannot be empty!");

        certificates[_id] = Certificate({
            id: _id,
            studentName: _studentName,
            course: _course,
            issueDate: _issueDate,
            issuer: msg.sender,
            exists: true
        });

        certificateIds.push(_id);
        emit CertificateIssued(_id, _studentName, _course, _issueDate, msg.sender);
    }

    function verifyCertificate(string memory _id)
        public
        view
        returns (
            string memory id,
            string memory studentName,
            string memory course,
            string memory issueDate,
            address issuer,
            bool exists
        )
    {
        require(certificates[_id].exists, "Certificate does not exist!");
        Certificate memory cert = certificates[_id];
        return (cert.id, cert.studentName, cert.course, cert.issueDate, cert.issuer, cert.exists);
    }

    function getTotalCertificates() public view returns (uint256) {
        return certificateIds.length;
    }
}