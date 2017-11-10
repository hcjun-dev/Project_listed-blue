$("tr[data-link]").click(function() {
  window.location = this.data("/items");
})