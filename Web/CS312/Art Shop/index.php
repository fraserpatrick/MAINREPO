<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> Art Shop </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="CSS.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.js"></script>
    </head>
    <body class="background">
        <header class="row fixed-top rounded-bottom header">
            <div class="col">
                <a href="XXXXXXX/Art-Shop" class="btn mt-1"> <i class="bi bi-house-door-fill headerIcons"></i> </a>
            </div>
            <div class="col">
                <h1 class="text-center mt-2 mb-2"> <i class="bi bi-flower1"></i> <u> Cara's Art Shop </u> <i class="bi bi-flower1"></i> </h1>
            </div>
            <div class="col">
                <a href="XXXXXXX/Art-Shop/admin.php" class="btn mt-1 float-end"> <i class="bi bi-gear-fill headerIcons"></i> </a>
            </div>

        </header>
        <br>
        <br>
        <?php
            $host = "XXXXXXX";
            $user = "XXXXXXX";
            $pass = "XXXXXXX";
            $dbname = $user;
            $conn = new mysqli($host, $user, $pass, $dbname);

            if ($conn->connect_error){
                die("Connection failed!");
            }

            $orderForm = isset($_POST["orderForm"]) ? $_POST["orderForm"] : Null;
            $ordered = isset($_POST["order"]) ? $_POST["order"] : Null;

            if ($ordered){
                $name = isset($_POST["name"]) ? trim($_POST["name"]) : "";
                $phone = isset($_POST["phone"]) ? $_POST["phone"] : "";
                $email = isset($_POST["email"]) ? trim($_POST["email"]) : "";
                $address1 = isset($_POST["addressLine1"]) ? trim($_POST["addressLine1"]).", " : "";
                $address2 = (isset($_POST["addressLine2"])&&(trim($_POST["addressLine2"]) !== "")) ? trim($_POST["addressLine2"]).", " : "";
                $addressCity = isset($_POST["addressCity"]) ? trim($_POST["addressCity"]).", " : "";
                $addressPostcode =isset($_POST["addressPostcode"]) ? trim($_POST["addressPostcode"]) : "";
                $address = $address1.$address2.$addressCity.$addressPostcode;

                $sql = "UPDATE `CS312-ArtShop-Art` SET Sold = '1' WHERE `CS312-ArtShop-Art`.ID = $ordered";
                $conn->query($sql);

                $sql = "INSERT INTO `CS312-ArtShop-Orders` (Name, Phone, Email, Address, ArtID) VALUES ('$name','$phone','$email','$address','$ordered')";
                $conn->query($sql);
            }

            if ($orderForm){
        ?>
        <div class="row p-5">
            <div class="col-6 container-fluid p-3 rounded artBox">
        <?php
            $sql = "SELECT * FROM `CS312-ArtShop-Art` WHERE `ID` = $orderForm";
            $result = $conn->query($sql);

            if (!$result){
                die("Query failed!");
            }
            else {
                $row = $result->fetch_assoc();
                echo
                    "<div class='col p-2 container'>"
                    ."<h5 class='text-center'><u><strong>".$row["ArtName"]."</strong></u></h5><br>"
                    ."<img src='data:image/png;base64,".base64_encode($row["Image"])."' class='' alt='".$row["ArtName"]."' width='100%'/>"."<br><br>"
                    ."<p> <strong> Description: </strong><br>".$row["Description"]."<br><br>"
                    ."<strong> Year of completion: </strong>".$row["CompletionDate"]."<br>"
                    ."<strong> Width: </strong>".$row["Width"]."cm <br>"
                    ."<strong> Height: </strong>".$row["Height"]."cm <br>"
                    ."<strong> Price: </strong> £".$row["Price"]."<br></p>"
                    ."</div>";
            }
        ?>
            </div>
            <div class="col-1"></div>
            <div class="col-5 container-fluid p-3 rounded artBox">
                <form action="index.php" method="post" onsubmit="return validateOrder()">
                   <div class="row">
                        <div class="col">
                            <h5><u> Personal Details: </u></h5>
                            <div class="form-floating mb-3 mt-3">
                                <input id="name" name="name" type="text" class="form-control textBox" placeholder="Enter name" required>
                                <label for="name"> Full name </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="phone" name="phone" type="number" class="form-control textBox" placeholder="Enter phone number" required>
                                <label for="phone"> Phone number </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="email" name="email" type="email" class="form-control textBox" placeholder="Enter email" required>
                                <label for="email"> Email </label>
                            </div>
                        </div>
                        <div class="col">
                            <h5><u> Address: </u></h5>
                            <div class="form-floating mb-3 mt-3">
                                <input id="addressLine1" name="addressLine1" type="text" class="form-control textBox" placeholder="Enter address" required>
                                <label for="addressLine1"> Line 1 </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input name="addressLine2" type="text" class="form-control textBox" placeholder="Enter address">
                                <label for="addressLine2"> Line 2 (Optional) </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="addressCity" name="addressCity" type="text" class="form-control textBox" placeholder="Enter address" required>
                                <label for="addressCity"> Town/City </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="addressPostcode" name="addressPostcode" type="text" class="form-control textBox" placeholder="Enter address" required>
                                <label for="addressPostcode"> Postcode </label>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group d-flex">
                        <button name="order" type="submit" class="btn btn-primary w-100 buttonIcons" value=<?php echo $orderForm ?>> Order <i class="bi bi-box2-heart"></i></button>
                        <a href="XXXXXXX/Art-Shop" class="btn btn-primary w-100 buttonIcons"> Cancel order <i class="bi bi-x-circle"></i></a>
                    </div>
                </form>
            </div>
        <?php
            }
            else{
                $sql = "SELECT * FROM `CS312-ArtShop-Art` WHERE `Sold` = 0 ORDER BY `ArtName` ASC";
                $result = $conn->query($sql);

                if (!$result){
                    die("Query failed!");
                }
        ?>
        <div class="row container-fluid p-5">
        <?php
            if ($result->num_rows>0){
                while ($row = $result->fetch_assoc()){
                    echo
                        "<div class='col-2 p-3 mb-5 me-3 container rounded artBox'>"
                            ."<h5 class='text-center'><u><strong>".$row["ArtName"]."</strong></u></h5><br>"
                            ."<img src='data:image/png;base64,".base64_encode($row["Image"])."' class='img-thumbnail' alt='".$row["ArtName"]."' width='100%'/>"."<br><br>"
                            ."<p> <strong> Description: </strong><br>".$row["Description"]."<br><br>"
                            ."<strong> Year of completion: </strong>".$row["CompletionDate"]."<br>"
                            ."<strong> Width: </strong>".$row["Width"]."cm <br>"
                            ."<strong> Height: </strong>".$row["Height"]."cm <br>"
                            ."<strong> Price: </strong> £".$row["Price"]."<br></p>"
                            ."<form action='index.php' method='post' class='d-grid mt-auto'> <button class='btn btn-primary buttonIcons' name='orderForm' type='submit' value=".$row["ID"]."> Order <i class='bi bi-bag-check-fill'></i></button> </form>"
                        ."</div>";
                }
            }
        ?>
        </div>
        <?php
            }
        ?>

        <script>
            function validateOrder(){
                const name = document.getElementById("name");
                const email = document.getElementById("email");
                const addressLine1 = document.getElementById("addressLine1");
                const addressCity = document.getElementById("addressCity");
                const addressPostcode = document.getElementById("addressPostcode");
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                errors = "";

                if (name.value.trim() === ""){
                    errors += "• Name is not valid.\n";
                }
               if (!email.value.trim().match(emailRegex)){
                   errors += "• Email is not valid.\n";
               }
                if (addressLine1.value.trim() === ""){
                    errors += "• Address line 1 is not valid.\n";
                }
                if (addressCity.value.trim() === ""){
                    errors += "• City is not valid.\n";
                }
                if (addressPostcode.value.trim() === ""){
                    errors += "• Postcode is not valid.\n";
                }

                if (errors !== ""){
                    window.alert("Please fix these issues to order this artwork.\n" + errors);
                }
                else {
                    window.alert("Artwork has been ordered.\nThank you very much " + name.value.trim() + "!");
                }

                return (errors === "");
            }
        </script>
    </body>
</html>