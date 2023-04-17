<?php
class Location {
    private $id;
    private $name;
    private $address;
    private $phone;
    private $email;
    private $companyId;
    private $db;

    public function __construct($id, $name, $address, $phone, $email, $companyId) {
        $this->id = $id;
        $this->name = $name;
        $this->address = $address;
        $this->phone = $phone;
        $this->email = $email;
        $this->companyId = $companyId;
        $this->db = Db::getInstance();
    }

    public static function getAll() {
        $db = Db::getInstance();
        $query = "SELECT * FROM `location`";
        $result = $db->query($query);
        $locations = array();
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $locations[] = new Location($row['id'], $row['name'], $row['address'], $row['phone'], $row['email'], $row['company_id']);
        }
        return $locations;
    }

    public static function getById($id) {
        $db = Db::getInstance();
        $query = "SELECT * FROM `location` WHERE `id` = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$id]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            return new Location($result['id'], $result['name'], $result['address'], $result['phone'], $result['email'], $result['company_id']);
        } else {
            return null;
        }
    }

    public function create() {
        $query = "INSERT INTO `location`(`name`, `address`, `phone`, `email`, `company_id`) VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        return $stmt->execute([$this->name, $this->address, $this->phone, $this->email, $this->companyId]);
    }

    public function update() {
        $query = "UPDATE `location` SET `name`=?,`address`=?,`phone`=?,`email`=?,`company_id`=? WHERE `id`=?";
        $stmt = $this->db->prepare($query);
        return $stmt->execute([$this->name, $this->address, $this->phone, $this->email, $this->companyId, $this->id]);
    }

    public function delete() {
        $query = "DELETE FROM `location` WHERE `id` = ?";
        $stmt = $this->db->prepare($query);
        return $stmt->execute([$this->id]);
    }

    public function getId() {
        return $this->id;
    }

    public function getName() {
        return $this->name;
    }

    public function getAddress() {
        return $this->address;
    }

    public function getPhone() {
        return $this->phone;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getCompanyId() {
        return $this->companyId;
    }
}
