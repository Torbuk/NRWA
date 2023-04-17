<?php

require_once 'path/to/Location.php';

class LocationController {

    public function create($name, $address, $phone, $email, $company_id) {
        $location = new Location(null, $name, $address, $phone, $email, $company_id);
        if ($location->create()) {
            return $location;
        } else {
            return false;
        }
    }

    public function delete($id) {
        $location = new Location($id, null, null, null, null, null);
        return $location->delete();
    }

    public function update($id, $name, $address, $phone, $email, $company_id) {
        $location = new Location($id, $name, $address, $phone, $email, $company_id);
        return $location->update();
    }

    public function getAll() {
        $locations = Location::getAll();
        return $locations;
    }

    public function getById($id) {
        $location = Location::getById($id);
        return $location;
    }

}
