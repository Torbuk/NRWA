<!-- contractor.view.php -->
<!DOCTYPE html>
<html>
<head>
    <title>Contractor List</title>
</head>
<body>
    <h1>Contractor List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Rate</th>
            <th>User ID</th>
            <th>Action</th>
        </tr>
        <?php foreach ($contractors as $contractor): ?>
            <tr>
                <td><?php echo $contractor->id; ?></td>
                <td><?php echo $contractor->name; ?></td>
                <td><?php echo $contractor->address; ?></td>
                <td><?php echo $contractor->phone; ?></td>
                <td><?php echo $contractor->email; ?></td>
                <td><?php echo $contractor->rate; ?></td>
                <td><?php echo $contractor->users_id; ?></td>
                <td>
                    <a href="index.php?controller=contractor_controller&action=update?id=<?php echo $contractor->id; ?>">Edit</a>
                    <a href="index.php?controller=contractor_controller&action=delete?id=<?php echo $contractor->id; ?>">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>