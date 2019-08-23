$(document).on('turbolinks:load', function() {
  $('.hidden').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".hidden").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });
});