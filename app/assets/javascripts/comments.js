// display comments index on wines/:id/comments nested index 
function loadComments(element) {
  $.get(`${element.dataset.wine_id}/comments`, function(response) {
    const comments = JSON.parse(response);
    console.log(comments);

    let template = Handlebars.compile($("load-comments-template").innerHTML);
    let result = template(comments);
    $("#show-comments").innerHTML += result;
  });
}