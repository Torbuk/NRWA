<?php
require_once 'path/to/Contractor.php';

class ContractorController {

    public function create($name, $address, $phone, $email, $rate, $users_id) {
        $contractor = new Contractor(null, $name, $address, $phone, $email, $rate, $users_id);
        if ($contractor->update()) {
            return $contractor;
        } else {
            return false;
        }
    }

    public function delete($id) {
        $contractor = new Contractor($id, null, null, null, null, null, null);
        return $contractor->delete();
    }

    public function update($id, $name, $address, $phone, $email, $rate, $users_id) {
        $contractor = new Contractor($id, $name, $address, $phone, $email, $rate, $users_id);
        return $contractor->update();
    }

    public function getAll() {
        $contractors = Contractor::getAll();
        return $contractors;
    }

    public function getById($id) {
        $contractor = Contractor::read($id);
        return $contractor;
    }

}
