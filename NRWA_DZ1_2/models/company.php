<?php
class Company {

    public $id;
    public $company_name;
    public $address;
    public $phone;
    public $fax;
    public $email;
    public $website;
    public $description;

    public function __construct($id, $company_name, $address, $phone, $fax, $email, $website, $description) {
        $this->id = $id;
        $this->company_name = $company_name;
        $this->address = $address;
        $this->phone = $phone;
        $this->fax = $fax;
        $this->email = $email;
        $this->website = $website;
        $this->description = $description;
    }

    public function create()
{   
    $db = Db::getInstance();
    // Prepare query
    $query = "INSERT INTO company
            SET
                company_name = :company_name,
                address = :address,
                phone = :phone,
                fax = :fax,
                email = :email,
                website = :website,
                description = :description";

    // Prepare statement
    $stmt = $this->$db->prepare($query);

    // Bind parameters
    $stmt->bindParam(":company_name", $this->company_name);
    $stmt->bindParam(":address", $this->address);
    $stmt->bindParam(":phone", $this->phone);
    $stmt->bindParam(":fax", $this->fax);
    $stmt->bindParam(":email", $this->email);
    $stmt->bindParam(":website", $this->website);
    $stmt->bindParam(":description", $this->description);

    // Execute query
    if ($stmt->execute()) {
        return true;
    } else {
        return false;
    }
}

public function delete()
{
    $db = Db::getInstance();
    $sql = "DELETE FROM `company` WHERE `id` = ?";
    $stmt = $this->$db->prepare($sql);
    $stmt->bind_param("i", $this->id);
    if ($stmt->execute()) {
        return true;
    } else {
        return false;
    }
}


// Update function
public function update()
{
    $db = Db::getInstance();
    // Prepare query
    $query = "UPDATE company
            SET
                company_name = :company_name,
                address = :address,
                phone = :phone,
                fax = :fax,
                email = :email,
                website = :website,
                description = :description
            WHERE
                id = :id";

    // Prepare statement
    $stmt = $this->$db->prepare($query);

    // Bind parameters
    $stmt->bindParam(":company_name", $this->company_name);
    $stmt->bindParam(":address", $this->address);
    $stmt->bindParam(":phone", $this->phone);
    $stmt->bindParam(":fax", $this->fax);
    $stmt->bindParam(":email", $this->email);
    $stmt->bindParam(":website", $this->website);
    $stmt->bindParam(":description", $this->description);
    $stmt->bindParam(":id", $this->id);

    // Execute query
    if ($stmt->execute()) {
        return true;
    } else {
        return false;
    }
}


    public function getAll() {
        $db = Db::getInstance();
        $stmt = $db->prepare("SELECT * FROM company");
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $companies = array();
        foreach ($results as $row) {
            $company = new Company(
                $row['id'],
                $row['company_name'],
                $row['address'],
                $row['phone'],
                $row['fax'],
                $row['email'],
                $row['website'],
                $row['description']
            );
            $companies[] = $company;
        }
        return $companies;
    }


    public function getById($id) {
        $db = Db::getInstance();
        $stmt = $db->prepare("SELECT * FROM company WHERE id = :id");
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        
        $company = new Company(
            $row['id'],
            $row['company_name'],
            $row['address'],
            $row['phone'],
            $row['fax'],
            $row['email'],
            $row['website'],
            $row['description']
        );
        return $company;
    }

}