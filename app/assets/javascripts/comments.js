function createComment() {
  return class {
    constructor(content) {
      this.content = content;
    }
    print() {
      console.log(this.content);
      return this.content;
    }
  }
}
const Comment = createComment();

function newCommentForm(element) {
  wineId = element.dataset.wineid;
  
  let template = Handlebars.compile($("#comment-form-template").html());
  let result = template(wineId);
  $("#post-comment").html(result);
  
  
  $('form').submit(postComment);
}

function postComment(event) {
  //prevent form from submitting the default way
  event.preventDefault();
  
  let values = $(this).serialize();
  
  let posting = $.post(`/comments`, values, function(response) {
    const comment = new Comment(JSON.parse(response).content);

    $("#show-comments").append(`${comment.print()}<br>`)
  });
}

function loadComments(element) {
  $.get(`${element.dataset.wine_id}/comments`, function(response) {
    const comments = JSON.parse(response);

    let template = Handlebars.compile($("#load-comments-template").html());
    let result = template(comments);
    $("#show-comments").html(result);
  });
}
