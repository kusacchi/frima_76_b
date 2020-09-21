$(document).on('turbolinks:load', function () {
  $('.show-subimage').click(function () {
    var $url = $(this).attr('image');
    $('.show-image').attr('image', $url);
  });
});