$(function() {
  var myReq = $.get("http://www.reddit.com/r/pixelart.json");
    console.log("myReq", myReq);

  myReq.done(function(data) {
    console.log('success');
    $.each(data.data.children, function( index, post ) {
      $('#results').append("<li>" + post.data.title + "</li>");
    });
  });

  myReq.fail(function(data) {
    if (data.statusTest === "error") {
      $('.error').append(":( server over capacity...");
    } else {
      $('.error').append('something else happened.');
    }
  });

  myReq.always(function(data) {
    console.log("REQUEST FINISHED");
  });
});
