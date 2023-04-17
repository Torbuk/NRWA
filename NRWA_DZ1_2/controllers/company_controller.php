<?php
require_once 'path/to/Company.php';

class CompanyController {

    public function create($company_name, $address, $phone, $fax, $email, $website, $description) {
        $company = new Company(null, $company_name, $address, $phone, $fax, $email, $website, $description);
        if ($company->create()) {
            return $company;
        } else {
            return false;
        }
    }

    public function delete($id) {
        $company = new Company($id, null, null, null, null, null, null, null);
        return $company->delete();
    }

    public function update($id, $company_name, $address, $phone, $fax, $email, $website, $description) {
        $company = new Company($id, $company_name, $address, $phone, $fax, $email, $website, $description);
        return $company->update();
    }

    public function getAll() {
        $companies = Company::getAll();
        return $companies;
    }

    public function getById($id) {
        $company = Company::getById($id);
        return $company;
    }

}

