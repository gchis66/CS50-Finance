<?php
 
    require("../includes/config.php"); 
 
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
      
        render("depositform.php", ["title" => "Deposit"]);
    }
 
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
 
        CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $_POST["deposit"], $_SESSION["id"]);
        
        redirect("/");
    }
 
?>