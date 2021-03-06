<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  

    <title>Colored Lists | <?php echo $pageTitle ?> </title>

    <link rel="stylesheet" href="./css/style.css" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="https://cdn.css-tricks.com/favicon.ico" />

    <script type='text/javascript' src='//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js?ver=1.3.2'></script>
    <script type='text/javascript' src='//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js?ver=1.3.2'></script>
    <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.jeditable.mini.js"></script>
    <script type="text/javascript" src="./js/lists.js"></script>
    <script type="text/javascript">
    	initialize();
    </script>
</head>

<body>

    <div id="page-wrap">


        <div id="header">


            <h1><a href="/lists/">Colored Lists</a></h1>


            <div id="control">

<?php
    if(isset($_SESSION['LoggedIn']) && isset($_SESSION['Username'])
        && $_SESSION['LoggedIn']==1):
?>
                <p><a href="/lists/logout.php" class="button">Log out</a> <a href="/lists/account.php" class="button">Your Account</a></p>
<?php else: ?>
                <p><a class="button" href="/lists/signup.php">Sign up</a> &nbsp; <a class="button" href="/lists/login.php">Log in</a></p>
<?php endif; ?>


            </div>

        </div>