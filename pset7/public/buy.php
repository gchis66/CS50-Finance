<?php
    require("../includes/config.php"); 
 
    if ($_SERVER["REQUEST_METHOD"] == "GET")
        {
        
            render("buy_form.php", ["title" => "Buy"]);
        }
    
    else if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $stock=lookup($_POST["symbol"]);
            
            if ($stock === false)
            {
                apologize("Could not find stock!");
            }
            $currentbalance = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"])[0]["cash"];
            
            if ($currentbalance < $_POST["shares"] * $stock["price"])
            {
                apologize("You too broke for that bruh!");
            }
            //updating cash below
            CS50::query("UPDATE users SET cash = cash - ? WHERE id = ?", $_POST["shares"] * $stock["price"], $_SESSION["id"]);
            //inserting bought shares into portfolio
            CS50::query("INSERT INTO portfoliotable (user_id, symbol, shares) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE shares = shares + VALUES(shares)", $_SESSION["id"], strtoupper($_POST["symbol"]), $_POST["shares"]);
            
            //inserting into history table
            CS50::query("INSERT INTO history (id, transaction, timestamp, symbol, shares, price) VALUES (?, ?, ?, ?, ?, ?)", $_SESSION["id"], "BUY", date('Y-m-d h:i:s'), strtoupper($_POST["symbol"]), $_POST["shares"], $stock["price"]);
            redirect("/");
        }


?>