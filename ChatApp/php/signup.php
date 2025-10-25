<?php
    session_start();
    include_once "config.php";
    
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    if(!empty($fname) && !empty($lname) && !empty($email) && !empty($password)){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
            // Check if email already exists
            $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if($result->num_rows > 0){
                echo "$email - This email already exists!";
            }else{
                $ran_id = rand(time(), 100000000);
                $status = "Active now";
                $encrypt_pass = md5($password);
                
                // Insert user data into the database
                $insert_stmt = $conn->prepare("INSERT INTO users (unique_id, fname, lname, email, password, status) VALUES (?, ?, ?, ?, ?, ?)");
                $insert_stmt->bind_param("isssss", $ran_id, $fname, $lname, $email, $encrypt_pass, $status);
                
                if($insert_stmt->execute()){
                    // Fetch the inserted user data
                    $select_stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
                    $select_stmt->bind_param("s", $email);
                    $select_stmt->execute();
                    $select_result = $select_stmt->get_result();
                    
                    if($select_result->num_rows > 0){
                        $row = $select_result->fetch_assoc();
                        
                        $_SESSION['unique_id'] = $row['unique_id'];
                        echo "success";
                    }else{
                        echo "Failed to retrieve user data!";
                    }
                }else{
                    echo "Failed to insert user data into the database! Error: " . $insert_stmt->error;
                }
            }
        }else{
            echo "$email is not a valid email!";
        }
    }else{
        echo "All input fields are required!";
    }
?>  