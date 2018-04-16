// display comments index on wines/:id/comments nested index 
function loadComments(element) {
  $.get(`${element.dataset.wine_id}/comments`, function(response) {
    const comments = JSON.parse(response);
    console.log(comments);

    let template = Handlebars.compile($("#load-comments-template").html());
    let result = template(comments);
    $("#show-comments").html(result);
  });
}