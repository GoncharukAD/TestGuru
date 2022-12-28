export class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.password
    this.confirm_password = form.elements.confirm_password
  }

  setup() {
    this.form.addEventListener ('input', event => {
      if (this.confirm_password.value != '') this.checkPasswords()
      else this.resetDefaultStyle()
    })
  }

  checkPasswords() {
    if (this.password.value == this.confirm_password.value) {
      this.password.className = "valid"
      this.confirm_password.className = "valid"

    } else {
      this.password.className = "invalid"
      this.confirm_password.className = "invalid"
    }
  }

  resetDefaultStyle() {
    this.password.className = "default"
    this.confirm_password.className = "default"
  }

}
