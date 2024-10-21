<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Frame Price Estimator Orders</title>
    </head>
    <body>
        <?php
            $password = isset($_POST["password"]) && ($_POST["password"]==="WinTheGameNow");

            if ($password){
                $host = "XXXXXXX";
                $user = "XXXXXXX";
                $pass = "XXXXXXX";
                $dbname = $user;
                $conn = new mysqli($host, $user, $pass, $dbname);

                if ($conn->connect_error){
                    die("Connection failed!");
                }

                $sql = "SELECT * FROM `CS312 CW1`";
                $result = $conn->query($sql);

                if (!$result){
                    die("Query failed!");
                }
        ?>
        <table>
            <tr>
                <th> Width (m) </th>
                <th> Height (m) </th>
                <th> Postage </th>
                <th> Email </th>
                <th> Price (Ex VAT £) </th>
                <th> DateRequested </th>
            </tr>
            <?php
                function daysBetween ($d1){
                    return ($d1->diff(new DateTime()))->days;
                }
                if ($result->num_rows>0){
                    while ($row = $result->fetch_assoc()){
                        if (($row["Postage"]==="economy" && daysBetween(new DateTime($row["DateRequested"]))>7) || ($row["Postage"]==="rapid" && daysBetween(new DateTime($row["DateRequested"]))>3) || ($row["Postage"]==="next day" && daysBetween(new DateTime($row["DateRequested"]))>1)){
                            echo "<tr>".
                                "<td><strong>".$row["Width"]."</strong></td>".
                                "<td><strong>".$row["Height"]."</strong></td>".
                                "<td><strong>".$row["Postage"]."</strong></td>".
                                "<td><strong>".$row["Email"]."</strong></td>".
                                "<td><strong>".$row["Price"]."</strong></td>".
                                "<td><strong>".$row["DateRequested"]."</strong></td>".
                                "</tr>";
                        }
                        else {
                            echo "<tr>".
                                "<td>".$row["Width"]."</td>".
                                "<td>".$row["Height"]."</td>".
                                "<td>".$row["Postage"]."</td>".
                                "<td>".$row["Email"]."</td>".
                                "<td>".$row["Price"]."</td>".
                                "<td>".$row["DateRequested"]."</td>".
                                "</tr>";
                        }
                    }
                }
            ?>
        </table>
        <?php
            $conn->close();
            }
            else {
                if ($_SERVER['REQUEST_METHOD'] === 'POST') echo "Incorrect password";
        ?>
                <form action="getrequests.php" method="post">
                    <p><input name="password" type="password" placeholder="Enter password"></p>
                    <input type="submit">
                </form>
        <?php
            }
        ?>
    </body>
</html>