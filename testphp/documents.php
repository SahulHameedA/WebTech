<?php include_once "common/header.php"; ?>
<?php include_once "common/navmenu.php"; ?>

<iframe src="docsMenu.php" height="600" width="15%" style="float:left;"></iframe>
<iframe name="content" src="docsContent.php" height="600" width="85%" style="float:left;"></iframe>


<?php include_once "common/footer.php"; ?>

<script>
		document.getElementById("documents").className = "active";
</script>