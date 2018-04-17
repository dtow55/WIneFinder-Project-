function storeIndex() {
  $.get("/stores.json", function (response) {
    console.log(response);
  });
}