<?php
include 'components/connect.php';

if (isset($_COOKIE['user_id'])) {
   $user_id = $_COOKIE['user_id'];
} else {
   $user_id = '';
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>User Replies</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/style.css">

</head>
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

   <!-- header section starts  -->
   <!-- header section starts  -->

<header class="header">

<nav class="navbar nav-1">
   <section class="flex">
      <a href="home.php" class="logo"><i class="fas fa-house"></i>MyHome</a>

      <ul>
         <li><a href="post_property.php">post property<i class="fas fa-paper-plane"></i></a></li>
      </ul>
   </section>
</nav>

<nav class="navbar nav-2">
   <section class="flex">
      <div id="menu-btn" class="fas fa-bars"></div>

      <div class="menu">
         <ul>
            <li><a href="#">my listings<i class="fas fa-angle-down"></i></a>
               <ul>
                  <li><a href="dashboard.php">dashboard</a></li>
                  <li><a href="post_property.php">post property</a></li>
                  <li><a href="my_listings.php">my listings</a></li>
                  <li><a href="sysmessages.php">admin messages</a></li>
               </ul>
            </li>
            <li><a href="#">options<i class="fas fa-angle-down"></i></a>
               <ul>
                  <li><a href="search.php">filter search</a></li>
                  <li><a href="listings.php">all listings</a></li>
               </ul>
            </li>
            <li><a href="#">help<i class="fas fa-angle-down"></i></a>
               <ul>
                  <li><a href="about.php">about us</a></i></li>
                  <li><a href="contact.php">contact us</a></i></li>
                  <li><a href="contact.php#faq">FAQ</a></i></li>
               </ul>
            </li>
         </ul>
      </div>

      <ul>
         <li><a href="saved.php">saved <i class="far fa-heart"></i></a></li>
         <li><a href="#">account <i class="fas fa-angle-down"></i></a>
            <ul>
               <li><a href="login.php">login now</a></li>
               <li><a href="register.php">register new</a></li>
               <?php if($user_id != ''){ ?>
               <li><a href="update.php">update profile</a></li>
               <li><a href="components/user_logout.php" onclick="return confirm('logout from this website?');">logout</a>
               <?php } ?></li>
            </ul>
         </li>
      </ul>
   </section>
</nav>

</header>

<!-- header section ends -->
   <!-- header section ends -->

   <!-- replies section starts  -->

   <section class="grid">

      <h1 class="heading">Replies</h1>

      <div class="box-container">
      <section class="grid">
      <h1 class="heading">Messages</h1>
      <form action="" method="POST" class="search-form">
         <input type="text" name="search_box" placeholder="Search messages..." maxlength="100" required>
         <button type="submit" class="fas fa-search" name="search_btn"></button>
      </form>
      <div class="box-container">

         <?php
         $select_replies = $conn->prepare("SELECT * FROM `messages` WHERE user_id = ?");
         $select_replies->execute([$user_id]);

         if ($select_replies->rowCount() > 0) {
            while ($fetch_replies = $select_replies->fetch(PDO::FETCH_ASSOC)) {
         ?>
               <div class="box">
                  <p>Message: <span><?= $fetch_replies['message']; ?></span></p>
                  <p>Reply: <span><?= $fetch_replies['reply_message']; ?></span></p>
               </div>
         <?php
            }
         } else {
            echo '<p class="empty">No replies found!</p>';
         }
         ?>

      </div>

   </section>

   <!-- replies section ends -->

   <?php

if(isset($success_msg)){
   foreach($success_msg as $success_msg){
      echo '<script>swal("'.$success_msg.'", "" ,"success");</script>';
   }
}

if(isset($warning_msg)){
   foreach($warning_msg as $warning_msg){
      echo '<script>swal("'.$warning_msg.'", "" ,"warning");</script>';
   }
}

if(isset($info_msg)){
   foreach($info_msg as $success_msg){
      echo '<script>swal("'.$info_msg.'", "" ,"info");</script>';
   }
}

if(isset($error_msg)){
   foreach($error_msg as $error_msg){
      echo '<script>swal("'.$error_msg.'", "" ,"error");</script>';
   }
}

?>

</body>

</html>