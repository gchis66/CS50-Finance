<?php
    require("../includes/config.php"); 
 
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        
        render("sell_form.php", ["title" => "Sell"]);
    }
 
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $rows = CS50::query("SELECT * FROM portfoliotable WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
 //MAKING SURE USER INPUT IS CORRECT
        if (count($rows) == 0)
        {
            apologize("You don't own any shares of {$_POST["symbol"]}");
        }
 
        $row = $rows[0];
 
        if ($row["shares"] < $_POST["shares"])
        {
            apologize("You don't own {$_POST["shares"]} of {$_POST["symbol"]}. Enter a lower quantity");
        }
 //SELLING SHARES BELOW
        if ($row["shares"] == $_POST["shares"]) 
        {
           CS50::query("DELETE FROM portfoliotable WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
        }
        else
        {
            CS50::query("UPDATE portfoliotable SET shares = ? WHERE user_id = ? AND symbol = ?", $row["shares"] - $_POST["shares"], $_SESSION["id"], $_POST["symbol"]);
        }
 
        $stock = lookup($_POST["symbol"]);
 //UPDATING USERS CASH AFTER SELLING STOCKS BELOW
        CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $_POST["shares"]*$stock["price"], $_SESSION["id"]);
        //adding transactions to history
        CS50::query("INSERT INTO history (id, transaction, timestamp, symbol, shares, price) VALUES (?, ?, ?, ?, ?, ?)", $_SESSION["id"], "SELL", date('Y-m-d h:i:s'), strtoupper($_POST["symbol"]), $_POST["shares"], $stock["price"]);
        redirect("/");
 
    }
 
?>