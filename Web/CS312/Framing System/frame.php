<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Frame Price Estimator</title>
    </head>
    <body>
        <h1>Frame Price Estimator</h1>
        <p><?php
            $host = "XXXXXXX";
            $user = "XXXXXXX";
            $pass = "XXXXXXX";
            $dbname = $user;
            $conn = new mysqli($host, $user, $pass, $dbname);

            if ($conn->connect_error){
                die("Connection failed!");
            }

            $unit = isset($_POST["unit"]) && ($_POST["unit"]!=="") ? $_POST["unit"] : "mm";
            $postage = isset($_POST["postage"]) && ($_POST["postage"]!=="") ? $_POST["postage"] : "economy";
            $VATChecked = isset($_POST["VAT"]) && ($_POST["VAT"]==="on");
            $optIn = isset($_POST["OptIn"]) && ($_POST["OptIn"]==="on");
            $enteredWidth = strip_tags(isset($_POST["width"]) && ($_POST["width"]!=="") ? $_POST["width"] : "0");
            $enteredHeight = strip_tags(isset($_POST["height"]) && ($_POST["height"]!=="") ? $_POST["height"] : "0");
            $email = strip_tags(isset($_POST["email"]) && ($_POST["email"]!=="") ? $_POST["email"] : "");
            $postagePrice = 0;

            if ($unit === "cm") {
                $width = $enteredWidth / 100;
                $height = $enteredHeight / 100;
            } elseif ($unit === "in") {
                $width = $enteredWidth * 0.0254;
                $height = $enteredHeight * 0.0254;
            } else {
                $width = $enteredWidth / 1000;
                $height = $enteredHeight / 1000;
            }

            $widthValid = ($width<2 && $width>0.2);
            $heightValid = ($height<2 && $height>0.2);
            $emailValid = (filter_var($email, FILTER_VALIDATE_EMAIL));

            if ($widthValid && $heightValid && (($emailValid && $optIn ) || (!$optIn))) {
                $area = ($width * $height);
                $price = round(($area * $area) + (70 * $area) + 7, 2);
                $maxSide = max($width, $height);

                if ($postage === "economy") $postagePrice = round(($maxSide * 2) + 7, 2);
                elseif ($postage === "rapid") $postagePrice = round(($maxSide * 3) + 7, 2);
                elseif ($postage === "next day") $postagePrice = round(($maxSide * 4) + 10, 2);

                $totalPrice = ($price + $postagePrice);

                if ($optIn){
                    $date = new DateTime();
                    $date = $date->format('d.m.Y');
                    $sql = "INSERT INTO `CS312 CW1` (`ID`, `Width`, `Height`, `Postage`, `Email`, `Price`, `DateRequested`) VALUES (NULL, '$width', '$height', '$postage', '$email', '$totalPrice', '$date');";
                    $conn->query($sql);

                }

                if ($VATChecked) {
                    $totalPrice = round(($totalPrice) * 1.2, 2);
                    echo "Your frame will cost £$price plus $postage postage of £$postagePrice giving a total price of £$totalPrice including VAT.";
                    mail($email, "Your Frame Price Estimate", "Your frame will cost £$price plus $postage postage of £$postagePrice giving a total price of £$totalPrice including VAT. Thank you for using the service. Link to our website: https://devweb2024.cis.strath.ac.uk/~nxb22128/CW1/");
                } else {
                    echo "Your frame will cost £$price plus $postage postage of £$postagePrice giving a total price of £$totalPrice without VAT.";
                    mail($email, "Your Frame Price Estimate", "Your frame will cost £$price plus $postage postage of £$postagePrice giving a total price of £$totalPrice without VAT. Thank you for using the service. Link to our website: https://devweb2024.cis.strath.ac.uk/~nxb22128/CW1/");
                }
                $conn->close();
            }
            else {
                if($_SERVER['REQUEST_METHOD'] === 'POST'){
                echo "Error with entered information!<br>";
            }
            ?></p>
        <p>
            Please enter your photo sizes to get a framing cost estimate.<br>
            Width and height must be between 0.2m and 2m.
        </p>
        <form action="frame.php" method="post">
            <p>
                Photo width: <input name="width" type="text" value="<?php if($widthValid) echo $enteredWidth;?>">
                <select name="unit">
                    <option value="mm" <?php if($unit==="mm") echo "selected";?>> mm </option>
                    <option value="cm" <?php if($unit==="cm") echo "selected";?>> cm </option>
                    <option value="in" <?php if($unit==="in") echo "selected";?>> In </option>
                </select>
            </p>
            <p> Photo height: <input name="height" type="text" value="<?php if($heightValid) echo $enteredHeight;?>"></p>
            <p> Postage:
                <input name="postage" type="radio" value="economy" <?php if($postage==="economy") echo "checked";?>> Economy
                <input name="postage" type="radio" value="rapid" <?php if($postage==="rapid") echo "checked";?>> Rapid
                <input name="postage" type="radio" value="next day" <?php if($postage==="next day") echo "checked";?>> Next Day
            </p>
            <p> Include VAT in price: <input name="VAT" type="checkbox" <?php echo ($_SERVER['REQUEST_METHOD'] === 'POST' && !$VATChecked) ? "" : "checked";?>></p>
            <p> I want to receive mail and future information about my framing calculation: <input name="OptIn" type="checkbox" <?php if($optIn) echo "checked";?>></p>
            <p> Enter your email: <input name="email" type="text" value="<?php if($emailValid) echo $email;?>"> </p>
            <input type="submit" value="Get estimate">
        </form>
        <?php
            }
        ?>
    </body>
</html>