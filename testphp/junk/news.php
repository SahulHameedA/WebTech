<?php include_once "common/header.php"; ?>
<?php include_once "common/navmenu.php"; ?> 
<h1> Welcome to the Home Page </h1>

<iframe src="homeMenu.php" height="600" width="15%" style="float:left;"></iframe>
<iframe name="content" src="news.html" height="600" width="85%" style="float:left;"></iframe>

<?php include_once "common/footer.php"; ?>

<script>
		document.getElementById("news").className = "active";
</script>