function showWines() {
  $.get("wines.json", function(response) {
    wines = JSON.parse(response);
    let template = Handlebars.compile($("#show-wines-template").html());
    let result = template(wines);
    $("#main").html(result);
  });
}

function showWine(element) {
  $.get(`wines/${element.dataset.id}.json`, function(response) {
    wine = JSON.parse(response);
    let template = Handlebars.compile($("#show-wine-template").html())
    let result = template(wine);
    $("#main").html(result);
  });
}