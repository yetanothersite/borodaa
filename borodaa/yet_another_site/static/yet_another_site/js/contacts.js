
function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}


var showPanel = function (result='') {
    var msgTxt = 'Invalid email';
    var html;
    if (result === 'error'){
        msgTxt = 'Something went wrong'; 
    } else if (result === 'success') {
        msgTxt = 'Thank you for contacting us!';
    }
    var html = '<div style="padding: 5em 0"><p style="text-align: center; font-size: 3em; font-weight: bold">' + msgTxt + '</p></div>';
    if (result === "error" || result === "success") {
        $('#lead-form').fadeOut()
    }
    $('#msg').html(html);
}


$('#lead-form').on('submit', function(event) {
    event.preventDefault();
    var inputEmail = $('#input-email');
    if (validateEmail(inputEmail.val())) {
        createPost();
    } else {
        showPanel();
    }
});


var createPost = function () {
     $.ajax({
        url: '/lead/create/',
        type: 'POST',
        data: $('#lead-form').serialize(),
        success: function () {
            showPanel('success');
        },
        error: function () {
            showPanel('error');
        },
    });
}
