<!DOCTYPE html>
<html>
<head>
    <title>Locations</title>
</head>
<body>
    <h1>Locations</h1>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Company ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($locations as $location): ?>
                <tr>
                    <td><?php echo $location->getName(); ?></td>
                    <td><?php echo $location->getAddress(); ?></td>
                    <td><?php echo $location->getPhone(); ?></td>
                    <td><?php echo $location->getEmail(); ?></td>
                    <td><?php echo $location->getCompanyId(); ?></td>
                    <td>
                        <a href="index.php?controller=location_controller&action=update?id=<?php echo $location->getId(); ?>">Update</a>
                        <a href="index.php?controller=location_controller&action=delete?id=<?php echo $location->getId(); ?>">Delete</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
