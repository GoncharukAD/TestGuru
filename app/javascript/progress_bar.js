import { ProgressBar } from './utilities/progress_vision'

document.addEventListener('turbolinks:load', function () {
  const progressBarId = 'progress_bar'
  const progressBar = document.getElementById(progressBarId)

  if (progressBar) new ProgressBar(progressBarId)
})
