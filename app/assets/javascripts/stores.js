function showStores() {
  Handlebars.registerPartial('storePartial', $("#store-partial").html());

  $.get("/stores.json", function (response) {
    const stores = JSON.parse(response);
    
    let template = Handlebars.compile($("#show-stores-template").html());
    let result = template(stores);
    $("#main").html(result);
  });
}

