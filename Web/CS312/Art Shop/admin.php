<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> Art Shop Admin </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="CSS.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="background">
    <?php
            $password = isset($_POST["password"]) && ($_POST["password"]==="WeKnowTheGame24");
            $deletingOrder = isset($_POST["deletingOrder"]) ? $_POST["deletingOrder"] : Null;
            $addArt = isset($_POST["addArt"]);

            if ($deletingOrder || $addArt){
                $password = true;
            }

            if ($password){
                $host = "XXXXXXX";
                $user = "XXXXXXX";
                $pass = "XXXXXXX";
                $dbname = $user;
                $conn = new mysqli($host, $user, $pass, $dbname);

                $name = isset($_POST["name"]) ? trim($_POST["name"]) : "";
                $compDate = isset($_POST["compDate"]) ? $_POST["compDate"] : "";
                $width = isset($_POST["width"]) ? $_POST["width"] : "1";
                $height = isset($_POST["height"]) ? $_POST["height"] : "1";
                $price = isset($_POST["price"]) ? $_POST["price"] : "0";
                $description = isset($_POST["description"]) ? trim($_POST["description"]) : "";

                if ($conn->connect_error){
                    die("Connection failed!");
                }

                if ($deletingOrder){
                    $sql = "DELETE FROM `CS312-ArtShop-Orders` WHERE `CS312-ArtShop-Orders`.OrderID = $deletingOrder";
                    $conn->query($sql);
                }

                if ($addArt){
                    $image = file_get_contents($_FILES['image']['tmp_name']);
                    $sql = $conn->prepare("INSERT INTO `CS312-ArtShop-Art` (ArtName, CompletionDate, Width, Height, Price, Description, Sold, Image) VALUES ('$name','$compDate','$width','$height','$price','$description','0',?)");

                    $sql->bind_param('b',$image);
                    $sql->send_long_data(0,$image);
                    $sql->execute();
                }
        ?>
        <ul class="nav nav-tabs nav-justified fixed-top customNav" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#view"> <strong> View Orders </strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#add"><strong> Add new artwork </strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="XXXXXXX/Art-Shop"><strong> Back to main shop </strong></a>
            </li>

        </ul>
        <br>
        <br>

        <div class="tab-content">
            <div id="view" class="container tab-pane active"><br>
                <table class="table table-bordered table-striped table-sm table-danger" style="border:2px solid;">
                    <tr>
                        <th> Name </th>
                        <th> Phone Number </th>
                        <th> Email </th>
                        <th> Address </th>
                        <th> Artwork Name </th>
                        <th> Artwork Image </th>
                    </tr>
        <?php
                $sql = "SELECT * FROM `CS312-ArtShop-Orders` INNER JOIN `CS312-ArtShop-Art` ON `CS312-ArtShop-Orders`.ArtID=`CS312-ArtShop-Art`.ID";
                $result = $conn->query($sql);

                if (!$result){
                    die("Query failed!");
                }
                else {
                    while ($row = $result->fetch_assoc()){
                        echo "<tr>".
                            "<td>".$row["Name"]."</td>".
                            "<td>".$row["Phone"]."</td>".
                            "<td>".$row["Email"]."</td>".
                            "<td>".$row["Address"]."</td>".
                            "<td>".$row["ArtName"]."</td>".
                            "<td><img src='data:image/png;base64,".base64_encode($row["Image"])."' alt='".$row["ArtName"]."' height='100'/></td>".
                            "<td>"."<form action='admin.php' method='post'><button name='deletingOrder' type='submit' class='btn btn-primary buttonIcons' value=".$row["OrderID"]."> Delete <i class='bi bi-x-circle'></i></button></form>"."</td>".
                        "</tr>";
                    }
                }
        ?>
                    </table>
                </div>
                <div id="add" class="container tab-pane fade"><br>
                    <form enctype="multipart/form-data" action="admin.php" method="post" onsubmit="return validateAdd()" class="artBox rounded container p-3">
                        <h5> Please enter new artwork details: </h5>
                        <div class="form-floating mb-3 mt-3">
                            <input id="name" name="name" type="text" class="form-control textBox" placeholder="Enter artwork name" required>
                            <label for="name"> Artwork name </label>
                        </div>
                        <div class="input-group">
                            <div class="form-floating mb-3 mt-3">
                                <input name="compDate" type="number" min="0" max="2024" class="form-control textBox" placeholder="Enter date" required>
                                <label for="compDate"> Completion year </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input name="width" type="number" min="1" class="form-control textBox" placeholder="Enter width" required>
                                <label for="width"> Width </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input name="height" type="number" min="1" class="form-control textBox" placeholder="Enter height" required>
                                <label for="height"> Height </label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input name="price" type="number" min="0" class="form-control textBox" placeholder="Enter price" required>
                                <label for="price"> Price </label>
                            </div>
                        </div>
                        <div class="form-floating mb-3 mt-3">
                            <input id="description" name="description" type="text" class="form-control textBox" placeholder="Enter description" required>
                            <label for="description"> Description </label>
                        </div>
                        <p>
                            <input name="image" type="file" required>
                        </p>
                        <button name="addArt" type="submit" class="btn btn-primary buttonIcons"> Add Artwork <i class="bi bi-plus-circle"></i></button>
                    </form>
                </div>
            </div>
        <?php
            }
            else {
        ?>
            <div class="d-flex align-items-center justify-content-center" style="height:85vh; width:100vw">
                <div class="rounded" style="background-color:#E9E9E9; border:2px solid;">
                    <form class="container p-4" action="admin.php" method="post">
                        <h5> Cara's Art Shop Admin </h5>
                        <br>
                        <div class="form-floating mb-3 mt-0">
                            <input name="password" type="password" class="form-control textBox" placeholder="Enter password">
                            <label for="password"> Password </label>
                        </div>
        <?php
            if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        ?>
            <div class="alert alert-danger alert-dismissible fade show">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong> Incorrect password! </strong>
            </div>
        <?php
            }
        ?>
                    <button type="submit" class="btn btn-primary  w-100"> Log in </button>
                    <br>
                    <br>
                    <a href="XXXXXXX/Art-Shop" class="btn btn-primary d-grid mx-auto"> Back to shop </a>
                </form>
            </div>
        </div>
        <?php
            }
        ?>

        <script>
            function validateAdd(){
                const name = document.getElementById("name");
                const description = document.getElementById("description");
                errors = "";

                if (name.value.trim() === ""){
                    errors += "• Name is empty.\n";
                }
                if (description.value.trim() === ""){
                    errors += "• Description is empty.\n";
                }

                if (errors !== ""){
                    window.alert("Please fix these issues to add this artwork.\n" + errors);
                }
                else {
                    window.alert("Artwork has been added.");
                }

                return (errors === "");
            }
        </script>
    </body>
</html>