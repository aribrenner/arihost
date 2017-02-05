ariHost(function(){
  var redirectInput = document.getElementById('node_redirect_url');
  var hash = window.location.hash;

  if (hash && redirectInput) {
    redirectInput.value += hash;
  }
})
