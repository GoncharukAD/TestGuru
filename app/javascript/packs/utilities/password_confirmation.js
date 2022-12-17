export class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.password
    this.confirm_password = form.elements.confirm_password

    this.setup()
  }

  setup() {
    this.form.addEventListener ('input', event => {
      if (this.confirm_password.value != '') this.checkPasswords()
      else this.resetDefaultStyle()
    })
  }

  checkPasswords() {
    if (this.password.value == this.confirm_password.value) {
      this.password.style.borderColor = 'green'
      this.confirm_password.style.borderColor = 'green'
    } else {
      this.password.style.borderColor = 'red'
      this.confirm_password.style.borderColor = 'red'
    }
  }

  resetDefaultStyle() {
    this.password.style.borderColor = '#ced4da'
    this.confirm_password.style.borderColor = '#ced4da'
  }

}
