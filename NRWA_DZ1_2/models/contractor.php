<?php
  class Contractor {
    private $id;
    private $name;
    private $address;
    private $phone;
    private $email;
    private $rate;
    private $users_id;
    private $db;

    public function __construct($id, $name, $address, $phone, $email, $rate, $users_id) {
        $this->id = $id;
        $this->name = $name;
        $this->address = $address;
        $this->phone = $phone;
        $this->email = $email;
        $this->rate = $rate;
        $this->users_id = $users_id;
        $this->db = Db::getInstance();
    }

    public function getAll() {
        $db = Db::getInstance();
        $query = "SELECT * FROM `contractor`";
        $result = $db->query($query);
        $contractors = array();
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $contractors[] = new Contractor($row['id'], $row['name'], $row['address'], $row['phone'], $row['email'], $row['rate'], $row['users_id']);
        }
        return $contractors;
    }
    

    public function read($id) {
        $db = Db::getInstance();
        $query = "SELECT * FROM `contractor` WHERE `id` = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$id]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            return new Contractor($result['id'], $result['name'], $result['address'], $result['phone'], $result['email'], $result['rate'], $result['users_id']);
        } else {
            return null;
        }
    }
    

    public function update() {
        if ($this->id) {
            $query = "UPDATE `contractor` SET `name`='$this->name',`address`='$this->address',`phone`='$this->phone',`email`='$this->email',`rate`='$this->rate',`users_id`='$this->users_id' WHERE `id` = $this->id";
            $this->db->query($query);
        } else {
            $query = "INSERT INTO `contractor`(`name`, `address`, `phone`, `email`, `rate`, `users_id`) VALUES ('$this->name', '$this->address', '$this->phone', '$this->email', '$this->rate', '$this->users_id')";
            $this->db->query($query);
            $this->id = $this->db->lastInsertId();
        }
    }
    

    public function delete() {
        $query = "DELETE FROM `contractor` WHERE `id` = $this->id";
        $this->db->query($query);
        $this->id = null;
    }
}

