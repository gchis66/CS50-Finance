<?php
    
    require("../includes/config.php");

    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("quote_form.php");
    }

    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $stock=lookup($_POST["symbol"]);
         render("quote_price.php",$stock);
    }
    
    
?>