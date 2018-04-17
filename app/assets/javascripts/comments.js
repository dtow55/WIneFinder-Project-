function loadComments(element) {
  $.get(`${element.dataset.wine_id}/comments`, function(response) {
    const comments = JSON.parse(response);

    let template = Handlebars.compile($("#load-comments-template").html());
    let result = template(comments);
    $("#show-comments").html(result);
  });
}

function newCommentForm() {
  let template = Handlebars.compile($("#comment-form-template").html());
  let result = template();
  $("#post-comment").html(result);
}

function postComment() {
  console.log('yes');
}



