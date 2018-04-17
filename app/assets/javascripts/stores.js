function showStores() {
  $.get("/stores.json", function (response) {
    const stores = JSON.parse(response);
    
    let template = Handlebars.compile($("#store-index-template").html());
    let result = template(stores);
    $("#main").html(result);
  });
}