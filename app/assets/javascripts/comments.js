function loadComments(element) {
  $.get(`${element.dataset.wine_id}/comments`, function(response) {
    const comments = JSON.parse(response);

    let template = Handlebars.compile($("#load-comments-template").html());
    let result = template(comments);
    $("#show-comments").html(result);
  });
}

function newCommentForm(element) {
  wineId = element.dataset.wineid;

  let template = Handlebars.compile($("#comment-form-template").html());
  let result = template();
  $("#post-comment").html(result);
  

  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    
    let values = $(this).serialize();
    console.log(values);

    let posting = $.post(`/comments`, values);
  });
}

function postComment() {
  let comment = {content: document.getElementsByName("content")[0].value}

  $.post("/comments", comment, function(response) {
    console.log(response);
  });
}



