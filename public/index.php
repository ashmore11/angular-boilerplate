<?php 

$base_path = $_SERVER[ 'PHP_SELF'];
$base_path = str_replace( '/index.php', '', $base_path );

?>

<!DOCTYPE html>
<html>

  <head>

    <!-- T I T L E -->
    <title>Angular Boilerplate</title>

    <!-- C H A R S E T -->
    <meta charset="utf-8">
    
    <!-- V I E W P O R T -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- F O N T S -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,400,300,700' rel='stylesheet' type='text/css'>
    
    <!-- C S S -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>/css/app.css">

    <!-- J S -->
    <script src="<?php echo $base_path; ?>/js/vendor.js"></script>
    <script src="<?php echo $base_path; ?>/js/app.js"></script>

    <!-- B A S E   P A T H -->
    <base href="<?php echo $base_path; ?>/">

  </head>

  <body>

    <!-- H E A D E R -->
    <header ng-include src="'templates/partials/header.html'" ng-controller="headerController"></header>
    
    <!-- C O N T E N T -->
    <main ng-view></main>

  </body>

</html>