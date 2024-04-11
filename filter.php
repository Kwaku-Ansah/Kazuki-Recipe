


<?php
//include('includes/topbar.php');
include('includes/header.php');

// Array containing all countries in alphabetical order
$countries = array(
    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria",
    "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
    "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia",
    "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Congo-Brazzaville)",
    "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czechia (Czech Republic)", "Democratic Republic of the Congo", "Denmark", "Djibouti",
    "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini (fmr. Swaziland)",
    "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea",
    "Guinea-Bissau", "Guyana", "Haiti", "Holy See", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland",
    "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia",
    "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives",
    "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro",
    "Morocco", "Mozambique", "Myanmar (formerly Burma)", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger",
    "Nigeria", "North Korea", "North Macedonia (formerly Macedonia)", "Norway", "Oman", "Pakistan", "Palau", "Palestine State", "Panama",
    "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda",
    "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia",
    "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa",
    "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Tajikistan", "Tanzania",
    "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine",
    "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam",
    "Yemen", "Zambia", "Zimbabwe"
);

// Establish a database connection
$con = mysqli_connect("localhost", "root", "", "kazuki");

// Check if the connection was successful
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">



<head>
    <!-- <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->



     <title>Kazuki Recipes | Filter</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">



    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select,
        button {
            padding: 6px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            margin-left: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ccc;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            color: #4caf50;
            text-decoration: none;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .no-recipes {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>

<body>


    




    <!-- Add the filter form -->
    <form method="POST">
        <label for="category">Category:</label>
        <select name="category" id="category">
            <option value="">All Categories</option>
            <option value="Breakfast">Breakfast</option>
            <option value="Dinner">Dinner</option>
            <option value="Lunch">Lunch</option>
            <option value="Dessert">Dessert</option>
        </select>

        <label for="country">Country:</label>
        <select name="country" id="country">
            <option value="">All Countries</option>
            <?php foreach ($countries as $country) { ?>
                <option value="<?php echo $country; ?>"><?php echo $country; ?></option>
            <?php } ?>
        </select>

        <button type="submit" name="filter">Filter</button>
    </form>

   <?php
    // Handle the filter button click
    if (isset($_POST['filter'])) {
        $selectedCategory = $_POST['category'];
        $selectedCountry = $_POST['country'];

        // Build the SQL query based on the selected options
        $query = "SELECT * FROM tblrecipes WHERE 1=1";

        if (!empty($selectedCategory)) {
            $query .= " AND category = '$selectedCategory'";
        }

        if (!empty($selectedCountry)) {
            $query .= " AND country = '$selectedCountry'";
        }

        // Execute the query
        $result = mysqli_query($con, $query);

        // Display the filtered recipes in a table format
        if (mysqli_num_rows($result) > 0) {
            echo "<table>
                    <tr>
                        <th>Recipe</th>
                        <th>Country</th>
                        <th>Category</th>
                        <th>Date Updated</th>

                    </tr>";

            while ($row = mysqli_fetch_array($result)) {
                echo "<tr>
                        <td><a href='recipe-details.php?rid=" . $row['id'] . "'>" . $row['recipeTitle'] . "</a></td>
                        <td>" . $row['country'] . "</td>
                        <td>" . $row['category'] . "</td>
                        <td>" . $row['postingDate'] . "</td>

                    </tr>";
            }

            echo "</table>";
        } else {
             echo "No recipe match found.";
            }
        } else {
            // echo "Error executing the query: " . mysqli_error($con);
        }

        // Close the database connection
        mysqli_close($con);

    ?>

    <!-- Rest of the code -->
</body>

</html>