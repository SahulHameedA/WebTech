<script type='text/javascript' src='//ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js?ver=1.3.2'></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.jeditable.mini.js"></script>
<script type="text/javascript" src="./js/lists.js"></script>
<script type="text/javascript">
    initialize();
</script>

<?php include_once "common/base.php"; ?>

<?php include_once "common/header.php"; ?>

<div id="main">
            <noscript>This site just doesn't work, period, without JavaScript</noscript>
 
            <br />
 
            <form action="db-interaction/lists.php" id="add-new" method="post">
                <input type="text" id="new-list-item-text" name="new-list-item-text" />
 
                <input type="hidden" id="current-list" name="current-list" value="<?php  ; ?>" />
                <input type="hidden" id="new-list-item-position" name="new-list-item-position" value="<?php ; ?>" />
 
                <input type="submit" id="add-new-submit" value="Add" class="button" />
            </form>
 
            <div class="clear"></div>
 
            <img src="/lists/images/newlist.png" alt="Your new list here!" />
 
        </div>

<?php include_once "common/close.php"; ?>