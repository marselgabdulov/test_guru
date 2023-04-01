class PasswordChecker {
  constructor(form) {
    this.form = form;
    this.password = form.elements.user_password;
    this.password_confirm = form.elements.user_password_confirmation;
    this.setup();
  }

  checkPassword() {
    const successIcon = document.getElementById('check-success');
    const failureIcon = document.getElementById('check-failure');

    if (this.password_confirm.value) {
      if (this.password.value === this.password_confirm.value) {
        this.showCheckIcon(successIcon, failureIcon);
      } else {
        this.showCheckIcon(failureIcon, successIcon);
      }
    } else {
      successIcon.classList.add('hide');
      failureIcon.classList.add('hide');
    }
  }

  showCheckIcon(firstNode, secondNode) {
    firstNode.classList.remove('hide');
    secondNode.classList.add('hide');
  }

  setup() {
    this.form.addEventListener('keyup', () => {
      if (this.password.value != '') {
        this.checkPassword();
      }
    });
  }
}

document.addEventListener('turbolinks:load', () => {
  const userForm = document.getElementById('new_user');

  if (userForm) {
    new PasswordChecker(userForm);
  }
});
