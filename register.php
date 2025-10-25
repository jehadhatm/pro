<?php

include 'components/connect.php';

if (isset($_COOKIE['user_id'])) {
   $user_id = $_COOKIE['user_id'];
} else {
   $user_id = '';
}

if (isset($_POST['submit'])) {

   $id = create_unique_id();
   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $c_pass = sha1($_POST['c_pass']);
   $c_pass = filter_var($c_pass, FILTER_SANITIZE_STRING);

   // Process the uploaded image
   $image = $_FILES['uimage']['name']; // Get the name of the uploaded image
   $image_tmp = $_FILES['uimage']['tmp_name']; // Get the temporary path of the uploaded image
   move_uploaded_file($image_tmp, "images/$image"); // Move the uploaded image to a desired directory

   $select_users = $conn->prepare("SELECT * FROM `users` WHERE email = ?");
   $select_users->execute([$email]);

   if ($select_users->rowCount() > 0) {
      $warning_msg[] = 'email already exist!';
   } else {
      if ($pass != $c_pass) {
         $warning_msg[] = 'Password not matched!';
      } else {
         $insert_user = $conn->prepare("INSERT INTO `users`(id, name, number, email, password, uimage) VALUES(?,?,?,?,?,?)");
         $insert_user->execute([$id, $name, $number, $email, $c_pass, $image]);

         if ($insert_user) {
            $verify_users = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ? LIMIT 1");
            $verify_users->execute([$email, $pass]);
            $row = $verify_users->fetch(PDO::FETCH_ASSOC);

            if ($verify_users->rowCount() > 0) {
               setcookie('user_id', $row['id'], time() + 60 * 60 * 24 * 30, '/');
               header('location:home.php');
            } else {
               $error_msg[] = 'something went wrong!';
            }
         }
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Register</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<body>

   <?php include 'components/user_header.php'; ?>

   <!-- register section starts  -->

   <section class="form-container">

      <form action="" method="POST" enctype="multipart/form-data"> <!-- Add enctype attribute for image upload -->
         <h3>create an account!</h3>
         <input type="tel" name="name" required maxlength="50" placeholder="enter your name" class="box">
         <input type="email" name="email" placeholder="name@gmail.com"  pattern="^[a-zA-Z0-9_\-.]+@gmail\.com" title="shoud not have symbols ,and should end with gmail.com" required class="box">
         <input type="number" name="number" required min="100000000" max="999999999" placeholder="Enter your number" class="box">
         <input type="password" name="pass" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="20" placeholder="Enter your password" class="box">
         <input type="password" name="c_pass" required maxlength="20" placeholder="confirm your password" class="box">
         <input type="file" name="uimage" accept="image/*" required> <!-- Add input field for image upload -->
         <p>already have an account? <a href="login.php">login now</a></p>
         <input type="submit" value="register now" name="submit" class="btn">
         <a href="gmail_link.php" class="btn">Link with Gmail</a>
         <a href="facebook_link.php" class="btn">Link with Facebook</a>
      </form>

   </To enable the user to link their account with Gmail and Facebook during registration, you need to add the necessary code for integrating OAuth authentication for both platforms. Here's an example of how you can modify your existing code to include Gmail and Facebook account linking functionality:

```php
<?php
