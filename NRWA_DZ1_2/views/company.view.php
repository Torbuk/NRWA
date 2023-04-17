<!DOCTYPE html>
<html>
<head>
    <title>Companies</title>
</head>
<body>
    <h1>Companies</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Fax</th>
            <th>Email</th>
            <th>Website</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($companies as $company): ?>
            <tr>
                <td><?php echo $company->id ?></td>
                <td><?php echo $company->company_name ?></td>
                <td><?php echo $company->address ?></td>
                <td><?php echo $company->phone ?></td>
                <td><?php echo $company->fax ?></td>
                <td><?php echo $company->email ?></td>
                <td><?php echo $company->website ?></td>
                <td><?php echo $company->description ?></td>
                <td>
                <a href="index.php?controller=company_controller&action=update&id=<?php echo $company->id ?>">Update</a>
                    <a href="index.php?controller=company_controller&action=delete?id=<?php echo $company->id ?>">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
    <a href="create.php">Create a new company</a>
</body>
</html>
