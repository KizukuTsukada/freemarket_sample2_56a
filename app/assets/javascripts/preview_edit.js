$(document).on('turbolinks:load', function() {
  $fileField = $('#upload-image')

  $($fileField).on('change', $fileField, function(e) {

      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#preview");

      var img = '<div class="img_view"><img alt="" class="img"><p><a href="#" class="img_del">削除する</a></p></div>';
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            height: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
      $(document).on("click", "#preview", function () {
        $(this).parent().remove();
      });
  });
});