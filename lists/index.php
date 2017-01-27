<?php include_once "common/header.php"; ?>
<?php include_once "common/base.php"; ?>

<div id="main">
            <noscript>This site just doesn't work, period, without JavaScript</noscript>
<?php
if(isset($_SESSION['LoggedIn']) && isset($_SESSION['Username'])):   
 
    include_once 'inc/class.lists.inc.php';
    $lists = new ColoredListsItems($db);
    list($LID, $URL, $order) = $lists->loadListItemsByUser();
 
    echo "ttt</ul>";
?>
 
            <br />
 
            <form action="db-interaction/lists.php" id="add-new" method="post">
                <input type="text" id="new-list-item-text" name="new-list-item-text" />
 
                <input type="hidden" id="current-list" name="current-list" value="<?php echo $LID; ?>" />
                <input type="hidden" id="new-list-item-position" name="new-list-item-position" value="<?php echo   $order; ?>" />
 
                <input type="submit" id="add-new-submit" value="Add" class="button" />
            </form>
 
            <div class="clear"></div>
 
            <div id="share-area">
                <p>Public list URL: <a target="_blank" href="http://localhost:8383/lists/<?php echo $URL ?>.html">http://localhost:8383/lists/<?php echo $URL ?>.html</a>
                &nbsp; <small>(Nobody but YOU will be able to edit this list)</small></p>
            </div>
 
 
<?php
elseif(isset($_GET['list'])):
    echo "ttt<ul id='list'>n";
 
    include_once 'inc/class.lists.inc.php';
    $lists = new ColoredListsItems($db);
    list($LID, $URL) = $lists->loadListItemsByListId();
 
    echo "ttt</ul>";
else:
?>
 
            <img src="/lists/images/newlist.png" alt="Your new list here!" />
 
<?php endif; ?>
 
        </div>

<?php include_once "common/ads.php"; ?>

<?php include_once "common/close.php"; ?>