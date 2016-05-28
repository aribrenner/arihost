$(function() {
  var copyButtonSelector = '.copy-button';
  var $copyButtons = $(copyButtonSelector);

  if ($copyButtons.length) {
    var clipboard = new Clipboard(copyButtonSelector);

    clipboard.on('success', function(s) {
      var button = s.trigger;
      button.innerHTML = 'Copied!';
    });

  }
})
