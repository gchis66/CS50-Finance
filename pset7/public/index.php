<?php

    // configuration
    require("../includes/config.php"); 
    
    $rows = CS50::query("SELECT symbol, shares FROM portfoliotable WHERE user_id = ?", $_SESSION["id"]);
    $balance = CS50::query("SELECT cash FROM users WHERE id = ?",$_SESSION["id"]);
    $_SESSION["balance"] = $balance[0]["cash"];
    
    $positions = [];
    foreach ($rows as $row)
    {
        $stock = lookup($row["symbol"]);
        
    if ($stock !== false)
        {
            $positions[] = [
                "name" => $stock["name"],
                "price" => $stock["price"],
                "shares" => $row["shares"],
                "symbol" => $row["symbol"]
        ];
        }
    }

    // render portfolio
    render("portfolio.php", ["positions" => $positions, "title" => "Portfolio" ]);

?>
