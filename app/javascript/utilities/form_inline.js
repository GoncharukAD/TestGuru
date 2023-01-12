document.addEventListener('turbolinks:load', function () {
  const controls = document.querySelectorAll('.form-inline-button')

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  const errors = document.querySelector('.resource-errors')

  if (errors && controls.length) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  const button = document.querySelector('.form-inline-button[data-test-id="' + testId + '"]')
  const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    button.textContent = 'Cansel'
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    button.textContent = 'Edit'
  }
}
