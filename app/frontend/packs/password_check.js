import { PasswordConfirmation } from './utilities/password_confirmation.js'

document.addEventListener('turbolinks:load', function () {
  const reg_form = document.querySelector('new_user_reg_form')
  if (reg_form) new PasswordConfirmation(reg_form)
})
