$(function() {
  $('#new_adopter_link').submit(function(e) {
    e.preventDefault();

    $.ajax({
      type: 'POST',
      url: this.action,
      data: $('#new_adopter_link').serialize(),
      success: function (data) {
        alert('success')
      },
      error: function(a, b, c) {
        $('#add_adopter_submit').prop('disabled', false);
        alert(b + ': ' + c);
      }
    });
  })
})
