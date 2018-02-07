$(function() {
  var $toggle = $('.welcome-page .js-show-me')

  if (!$toggle.length) { return }

  $toggle.click(function(){
    $('.js-example-urls').toggleClass('hidden')
  })
})
