(function() {
  $(document).ready( function(){
    return $('#notifications').infiniteScroll({
      path: "ul.pagination a[rel=next]",
      append: ".notification",
      history: false,
      prefill: true,
      status: '.page-load-status'
    });
  });

}).call(this);