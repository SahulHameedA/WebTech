function initialize() {

  // WRAP LIST TEXT IN A SPAN, AND APPLY FUNCTIONALITY TABS
  $("#list li")
    .wrapInner("<span>")
    .append("<div class='draggertab tab'></div><div class='colortab tab'></div></div><div class='deletetab tab'></div><div class='donetab tab'></div>");

};



bindAllTabs("#list li span");



$(".donetab").live("click", function() {
    var id = $(this).parent().attr('id');
    if(!$(this).siblings('span').children('img.crossout').length)
    {
        $(this)
            .parent()
                .find("span")
                .append("<img src='/images/crossout.png' class='crossout' />")
                .find(".crossout")
                .animate({
                    width: "100%"
                })
                .end()
            .animate({
                opacity: "0.5"
            },
            "slow",
            "swing",
            toggleDone(id, 1));
    }
    else
    {
        $(this)
            .siblings('span')
                .find('img.crossout')
                    .remove()
                    .end()
                .animate({
                    opacity : 1
                },
                "slow",
                "swing",
                toggleDone(id, 0));
 
    }
});








// COLOR CYCLING
// Does AJAX save, but no visual feedback
$(".colortab").live("click", function(){
    $(this).parent().nextColor();
 
    var id = $(this).parent().attr("id"),
        color = $(this).parent().attr("color");
 
    $.ajax({
        type: "POST",
        url: "db-interaction/lists.php",
        data: "action=color&id="   id   "&color="   color,
        success: function(msg) {
            // error message
        }
    });
});




jQuery.fn.nextColor = function() {

    var curColor = $(this).attr("class");

    if (curColor == "colorBlue") {
        $(this).removeClass("colorBlue").addClass("colorYellow").attr("color","2");
    } else if (curColor == "colorYellow") {
        $(this).removeClass("colorYellow").addClass("colorRed").attr("color","3");
    } else if (curColor == "colorRed") {
        $(this).removeClass("colorRed").addClass("colorGreen").attr("color","4");
    } else {
        $(this).removeClass("colorGreen").addClass("colorBlue").attr("color","1");
    };

};






// AJAX style deletion of list items
$(".deletetab").live("click", function(){
    var thiscache = $(this),
        list = $('#current-list').val(),
        id = thiscache.parent().attr("id"),
        pos = thiscache.parents('li').attr('rel');
 
    if (thiscache.data("readyToDelete") == "go for it") {
        $.ajax({
            type: "POST",
            url: "db-interaction/lists.php",
            data: {
                    "list":list,
                    "id":id,
                    "action":"delete",
                    "pos":pos
                },
            success: function(r){
                    var $li = $('#list').children('li'),
                        position = 0;
                    thiscache
                        .parent()
                            .hide("explode", 400, function(){$(this).remove()});
                    $('#list')
                        .children('li')
                            .not(thiscache.parent())
                            .each(function(){
                                    $(this).attr('rel',   position);
                                });
                },
            error: function() {
                $("#main").prepend("Deleting the item failed...");
            }
        });
    }
    else
    {
        thiscache.animate({
            width: "44px",
            right: "-64px"
        }, 200)
        .data("readyToDelete", "go for it");
    }
});




// MAKE THE LIST SORTABLE VIA JQUERY UI
// calls the SaveListOrder function after a change
// waits for one second first, for the DOM to set, otherwise it's too fast.
$("#list").sortable({
    handle   : ".draggertab",
    update   : function(event, ui){
        var id = ui.item.attr('id');
        var rel = ui.item.attr('rel');
        var t = setTimeout("saveListOrder('" id "', '" rel "')",500);
    },
    forcePlaceholderSize: true
});




// This is seperated to a function so that it can be called at page load
// as well as when new list items are appended via AJAX
function bindAllTabs(editableTarget) {
 
    // CLICK-TO-EDIT on list items
    $(editableTarget).editable("db-interaction/lists.php", {
        id        : 'listItemID',
        indicator : 'Saving...',
        tooltip   : 'Double-click to edit...',
        event     : 'dblclick',
        submit    : 'Save',
        submitdata: {action : "update"}
    });
 
}



$('#add-new').submit(function(){

    var $whitelist = '<b><i><strong><em><a>',
        forList = $("#current-list").val(),
        newListItemText = strip_tags(cleanHREF($("#new-list-item-text").val()), $whitelist),
        URLtext = escape(newListItemText),
        newListItemRel = $('#list li').size()+1;
    
    if(newListItemText.length > 0) {
        $.ajax({
            type: "POST",
            url: "db-interaction/lists.php",
            data: "action=add&list="   forList   "&text="   URLtext   "&pos="   newListItemRel,
            success: function(theResponse){
              $("#list").append("<li color='1' class='colorBlue' rel='" newListItemRel "' id='"   theResponse   "'><span id="" theResponse "listitem" title='Click to edit...'>"   newListItemText   "</span><div class='draggertab tab'></div><div class='colortab tab'></div><div class='deletetab tab'></div><div class='donetab tab'></div></li>");
              bindAllTabs("#list li[rel='" newListItemRel "'] span");
              $("#new-list-item-text").val("");
            },
            error: function(){
                // uh oh, didn't work. Error message?
            }
        });
    } else {
        $("#new-list-item-text").val("");
    }
    return false; // prevent default form submission
});


function saveListOrder(itemID, itemREL){
    var i = 1,
        currentListID = $('#current-list').val();
    $('#list li').each(function() {
        if($(this).attr('id') == itemID) {
            var startPos = itemREL,
                currentPos = i;
            if(startPos < currentPos) {
                var direction = 'down';
            } else {
                var direction = 'up';
            }
            var postURL = "action=sort&currentListID=" currentListID
                 "&startPos=" startPos
                 "&currentPos=" currentPos
                 "&direction=" direction;
 
            $.ajax({
                type: "POST",
                url: "db-interaction/lists.php",
                data: postURL,
                success: function(msg) {
                    // Resets the rel attribute to reflect current positions
                    var count=1;
                    $('#list li').each(function() {
                        $(this).attr('rel', count);
                        count  ;
                    });
                },
                error: function(msg) {
                    // error handling here
                }
            });
        }
        i  ;
    });

}


function toggleDone(id, isDone)
{
    $.ajax({
        type: "POST",
        url: "db-interaction/lists.php",
        data: "action=done&id=" id "&done=" isDone
    })
}



// Check for JS in the href attribute
function cleanHREF(str) {
    return str.replace(https://cdn.css-tricks.com/\<a(.*?)href=['"](javascript:)(.+?)<\/a>/gi, "Naughty!");
}



var $whitelist = '<b><i><strong><em><a>',

// Strip HTML tags with a whitelist
function strip_tags(str, allowed_tags) {
 
    var key = '', allowed = false;
    var matches = [];
    var allowed_array = [];
    var allowed_tag = '';
    var i = 0;
    var k = '';
    var html = '';
 
    var replacer = function(search, replace, str) {
        return str.split(search).join(replace);
    };
 
    // Build allowes tags associative array
    if (allowed_tags) {
        allowed_array = allowed_tags.match(/([a-zA-Z]+)/gi);
    }
 
    str += '';
 
    // Match tags
    matches = str.match(/(<\/?[\S][^>]*>)/gi);
 
    // Go through all HTML tags
    for (key in matches) {
        if (isNaN(key)) {
            // IE7 Hack
            continue;
        }
 
        // Save HTML tag
        html = matches[key].toString();
 
        // Is tag not in allowed list? Remove from str!
        allowed = false;
 
        // Go through all allowed tags
        for (k in allowed_array) {
            // Init
            allowed_tag = allowed_array[k];
            i = -1;
 
            if (i != 0) { i = html.toLowerCase().indexOf('<'+allowed_tag+'>');}
            if (i != 0) { i = html.toLowerCase().indexOf('<'+allowed_tag+' ');}
            if (i != 0) { i = html.toLowerCase().indexOf('</'+allowed_tag)   ;}
 
            // Determine
            if (i == 0) {
                allowed = true;
                break;
            }
        }
 
        if (!allowed) {
            str = replacer(html, "", str); // Custom replace. No regexing
        }
    }
 
    return str;
}

