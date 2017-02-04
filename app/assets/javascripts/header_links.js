$(document).on('ready page:load', function(event) {
  var path = window.location.pathname;
  $('.js-header-links a').each(function (){
    var $this = $(this);
    if(path == $this.attr('href')) {
      $this.addClass('current-link')
    }
  })
});
