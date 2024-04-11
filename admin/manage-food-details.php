

<?php
session_start();
error_reporting(0);
include('../includes/dbconnection.php');

if (strlen($_SESSION['frsaid']) == 0) {
    header('location:logout.php');
} else {
    // Code for deletion   
    if ($_GET['action'] == 'delete') {
        $rid = intval($_GET['bsid']);
        $query = mysqli_query($con, "DELETE FROM tblrecipes WHERE id='$rid'");
        $affectedRows = mysqli_affected_rows($con);
        if ($affectedRows > 0) {
            // Recipe deleted successfully
            echo "<script>alert('Recipe deleted successfully.');</script>";
            // Update the user interface view or redirect to the updated view
            echo "<script type='text/javascript'> document.location = 'listed-recipes.php'; </script>";
        } else {
            // Failed to delete the recipe
            echo "<script>alert('Failed to delete the recipe. Please try again.');</script>";
        }
    }
}
?>