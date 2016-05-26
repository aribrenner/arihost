$(function(){
  var passwordInput = document.getElementById('user_password');
  var passwordConfirmationInput = document.getElementById('password_confirmation');
  var $allPasswordInputs = $('.js-user-password-input');

  if (passwordInput && passwordConfirmationInput) {

    $allPasswordInputs.change(function() {
      var password = passwordInput.value;
      var passwordConfirmation = passwordConfirmationInput.value;

      if (password && passwordConfirmation &&
          password != passwordConfirmation ) {

          passwordConfirmationInput.setCustomValidity('password does not match');
      } else {
        passwordConfirmationInput.setCustomValidity('');
      }
    })

  }
})
