
function LikeFunction(qid, sid, like, dislike) {
    $.ajax({
        type: 'POST',
        url: '../updateLike',
        cache: false,
        data: {
            qID: qid,
            uID: sid,
        },

        success: function (data) {
            checkFunction(1, qid, sid, like, dislike);
            $("#likebtn" + qid).text(like + 1);
        },
        error: function (data) {
        }
    });
}

function UnLikeFunction(qid, sid, like, dislike) {
    $.ajax({
        type: 'POST',
        url: '../updateUnLike',
        cache: false,
        async: false,
        data: {
            qID: qid,
            uID: sid,
        },

        success: function (data) {
            checkFunction(2, qid, sid, like, dislike);
            $("#dislikebtn" + qid).text(dislike + 1);
        },
        error: function (data) {
        }
    });
}

function likeToUnLike(qid, sid, like, dislike) {
    $.ajax({
        type: 'POST',
        url: '../likeToUnLike',
        cache: false,
        async: false,
        data: {
            qID: qid,
            uID: sid,
        },

        success: function (data) {
            checkFunction(3, qid, sid, like, dislike);
            $("#likebtn" + qid).text(like - 1);
            $("#dislikebtn" + qid).text(dislike + 1);
            updateStatus:"true";
        },
        error: function (data) {
        }
    });
}

function unLikeToLike(qid, sid, like, dislike) {
    $.ajax({
        type: 'POST',
        url: '../unLikeToLike',
        cache: false,
        data: {
            qID: qid,
            uID: sid,
        },

        success: function (data) {
            checkFunction(4, qid, sid, like, dislike);
            $("#likebtn" + qid).text(like + 1);
            $("#dislikebtn" + qid).text(dislike - 1);
        },
        error: function (data) {
        }
    });
}


function checkFunction(status, qid, sid, like, dislike) {

    if (status === 1) {
        $("#likebtn" + qid).addClass('fa-thumbs-up');
        $("#likebtn" + qid).css({"color": "blue"});
        $("#likebtn" + qid).removeAttr("onclick");
        $("#dislikebtn" + qid).click(function() {
            likeToUnLike(qid, sid, like+1, dislike-1);
        });
    } else if (status === 2) {
        $("#dislikebtn" + qid).addClass('fa-thumbs-down');
        $("#dislikebtn" + qid).css({"color": "red"});
        $("#dislikebtn" + qid).removeAttr("onclick");
        $("#likebtn" + qid).click(function() {
            unLikeToLike(qid, sid, like-1, dislike+1);
        });
    } else if (status === 3) {
        $("#likebtn" + qid).removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up');
        $("#dislikebtn" + qid).removeClass('fa-thumbs-o-down').addClass('fa-thumbs-down');
        $("#likebtn" + qid).css({"color": "black"});
        $("#dislikebtn" + qid).css({"color": "red"});
        $("#dislikebtn" + qid).removeAttr("onclick");
        $("#likebtn" + qid).click(function() {
            unLikeToLike(qid, sid, like-1, dislike+1);
        });
    } else if (status === 4) {
        $("#likebtn" + qid).removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up');
        $("#dislikebtn" + qid).removeClass('fa-thumbs-down').addClass('fa-thumbs-o-down');
        $("#likebtn" + qid).css({"color": "blue"});
        $("#dislikebtn" + qid).css({"color": "black"});
        $("#likebtn" + qid).removeAttr("onclick");
        $("#dislikebtn" + qid).click(function() {
            likeToUnLike(qid, sid, like+1, dislike-1);
        });
    }

}
