<?php

include '../components/connect.php';

if (isset($_COOKIE['admin_id'])) {
   $admin_id = $_COOKIE['admin_id'];
} else {
   $admin_id = '';
   header('location:login.php');
}

if (isset($_POST['delete'])) {

   $delete_id = $_POST['delete_id'];
   $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

   $verify_delete = $conn->prepare("SELECT * FROM messages WHERE id = ?");
   $verify_delete->execute([$delete_id]);

   if ($verify_delete->rowCount() > 0) {
      $delete_bookings = $conn->prepare("DELETE FROM messages WHERE id = ?");
      $delete_bookings->execute([$delete_id]);
      $success_msg[] = 'Message deleted!';
   } else {
      $warning_msg[] = 'Message deleted already!';
   }
}

if (isset($_POST['reply'])) {
   $reply_id = $_POST['reply_id'];
   $reply_message = $_POST['reply_message'];

   // Validate and sanitize the reply_id
   if (empty($reply_id)) {
       $error_msg[] = 'Reply ID is required!';
   } else {
       $reply_id = filter_var($reply_id, FILTER_SANITIZE_STRING);
   }

   // Validate and sanitize the reply_message
   if (empty($reply_message)) {
       $error_msg[] = 'Reply message is required!';
   } else {
       $reply_message = filter_var($reply_message, FILTER_SANITIZE_STRING);
   }

   // If there are no validation errors, proceed with the INSERT query
   if (empty($error_msg)) {
       $insert_reply = $conn->prepare("UPDATE messages SET reply_message = ? WHERE id = ?");
       $insert_reply->execute([$reply_message, $reply_id]);

       $success_msg[] = 'Reply sent!';
   }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Messages</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
   <link rel="stylesheet" href="../css/admin_style.css">
</head>

<body>
   <?php include '../components/admin_header.php'; ?>

   <section class="grid">
      <h1 class="heading">Messages</h1>
      <form action="" method="POST" class="search-form">
         <input type="text" name="search_box" placeholder="Search messages..." maxlength="100" required>
         <button type="submit" class="fas fa-search" name="search_btn"></button>
      </form>
      <div class="box-container">
         <?php
         if (isset($_POST['search_box']) || isset($_POST['search_btn'])) {
            $search_box = $_POST['search_box'];
            $search_box = filter_var($search_box, FILTER_SANITIZE_STRING);
            $select_messages = $conn->prepare("SELECT * FROM `messages` WHERE name LIKE '%{$search_box}%' OR number LIKE '%{$search_box}%' OR email LIKE '%{$search_box}%'");
            $select_messages->execute();
         } else {
            $select_messages = $conn->prepare("SELECT * FROM `messages`");
            $select_messages->execute();
         }
         if ($select_messages->rowCount() > 0) {
            while ($fetch_messages = $select_messages->fetch(PDO::FETCH_ASSOC)) {
         ?>
               <div class="box">
                  <p>Name: <span><?= $fetch_messages['name']; ?></span></Here's the continuation of the updated code:

```php
                  <p>Email: <a href="mailto:<?= $fetch_messages['email']; ?>"><?= $fetch_messages['email']; ?></a></p>
                  <p>Number: <a href="tel:<?= $fetch_messages['number']; ?>"><?= $fetch_messages['number']; ?></a></p>
                  <p>Message: <span><?= $fetch_messages['message']; ?></span></p>
                  <form action="" method="POST">
                     <input type="hidden" name="delete_id" value="<?= $fetch_messages['id']; ?>">
                     <input type="submit" value="Delete Message" onclick="return confirm('Delete this message?');" name="delete" class="delete-btn">
                  </form>
                  <form action="" method="POST">
                     <input type="hidden" name="reply_id" value="<?= $fetch_messages['id']; ?>">
                     <textarea name="reply_message" placeholder="Enter your reply..." required></textarea>
                     <input type="submit" value="Reply" name="reply" class="reply-btn">
                  </form>
               </div>
         <?php
            }
         } elseif (isset($_POST['search_box']) || isset($_POST['search_btn'])) {
            echo '<p class="empty">Results not found!</p>';
         } else {
            echo '<p class="empty">You have no messages!</p>';
         }
         ?>
      </div>
   </section>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
   <script src="../js/admin_script.js"></script>
   <?php include '../components/message.php'; ?>
</body>

</html>