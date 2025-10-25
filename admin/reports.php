<?php

include 'C:/wamp64/www/pro/components/connect.php';

if (isset($_COOKIE['admin_id'])) {
   $admin_id = $_COOKIE['admin_id'];
} else {
   $admin_id = '';
   header('location:login.php');
}

if (isset($_POST['delete'])) {

   $delete_id = $_POST['report_id'];
   $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

   $verify_delete = $conn->prepare("SELECT * FROM `reports` WHERE id = ?");
   $verify_delete->execute([$delete_id]);

   if ($verify_delete->rowCount() > 0) {
      $delete_report = $conn->prepare("DELETE FROM `reports` WHERE id = ?");
      $delete_report->execute([$delete_id]);
      $success_msg[] = 'Report deleted successfully!';
   } else {
      $warning_msg[] = 'Report deleted already!';
   }
}

?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="../css/admin_style.css">
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Reports</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<body>

   <?php include 'C:/wamp64/www/pro/components/admin_header.php'; ?>

   <section class="requests">

      <h1 class="heading">All Reports</h1>

      <div class="box-container">

         <?php
         $select_reports = $conn->prepare("SELECT * FROM `reports`");
         $select_reports->execute();
         if ($select_reports->rowCount() > 0) {
            while ($fetch_report = $select_reports->fetch(PDO::FETCH_ASSOC)) {

               $select_user = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
               $select_user->execute([$fetch_report['user_id']]);
               $fetch_user = $select_user->fetch(PDO::FETCH_ASSOC);

               $select_property = $conn->prepare("SELECT * FROM `property` WHERE id = ?");
               $select_property->execute([$fetch_report['property_id']]);
               $fetch_property = $select_property->fetch(PDO::FETCH_ASSOC);
         ?>
               <div class="box">
                  <p>Name: <span><?= $fetch_user['name']; ?></span></p>
                  <p>Number: <a href="tel:<?= $fetch_user['number']; ?>"><?= $fetch_user['number']; ?></a></p>
                  <p>Email: <a href="mailto:<?= $fetch_user['email']; ?>"><?= $fetch_user['email']; ?></a></p>
                  <p>Report Type: <span><?= $fetch_report['report_type']; ?></span></p>
                  <p>Property: <span><?= $fetch_property['property_name']; ?></span></p>
                  <form action="" method="POST">
                     <input type="hidden" name="report_id" value="<?= $fetch_report['id']; ?>">
                     <input type="submit" value="Delete Report" class="btn" onclick="return confirm('Remove this report?');" name="delete">
                     <a href="view_property.php?get_id=<?= $fetch_property['id']; ?>" class="btn">View Property</a>
                  </form>
               </div>
         <?php
            }
         } else {
            echo '<p class="empty">There are no reports!</p>';
         }
         ?>

      </div>

   </section>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

   

   <!-- custom js file link  -->
   <script src="js/script.js"></script>

   <?php include 'C:/wamp64/www/pro/components/message.php'; ?>

</body>

</html>