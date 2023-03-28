document.addEventListener('turbolinks:load', () => {
  const userForm = document.getElementById('new_user');

  if (userForm) {
    userForm.addEventListener('input', checkPassword);
  }
});

function checkPassword() {
  const passwordField = document.getElementById('user_password');
  const passwordConfirmationField = document.getElementById(
    'user_password_confirmation'
  );
  const successIcon = document.getElementById('check-success');
  const failureIcon = document.getElementById('check-failure');

  const password = passwordField.value;
  const confirmedPassword = passwordConfirmationField.value;

  if (confirmedPassword) {
    if (password === confirmedPassword) {
      showCheckIcon(successIcon, failureIcon);
    } else {
      showCheckIcon(failureIcon, successIcon);
    }
  } else {
    successIcon.classList.add('hide');
    failureIcon.classList.add('hide');
  }
}

function showCheckIcon(firstNode, secondNode) {
  firstNode.classList.remove('hide');
  secondNode.classList.add('hide');
}
