// jQuery "$(document).ready()" equivalent for Trubolinks 5 usage

$(document).on('turbolinks:load', function() {
  console.log("trubolinks:load - jQuery Ready!");

  $(function() {
    cloudinaryUploaderInit();
  });
});

var cloudinaryUploaderInit = function() {
  // console.log("cloudinaryUploaderInit");
  if ($.fn.cloudinary_fileupload !== undefined) {
    $("input.cloudinary-fileupload[type=file]").each(function() {
      $(this).cloudinary_fileupload();
    });
  } else {
    // console.log("`cloudinary_fileupload` is undefined");
  }
}