import { TimerBar } from './utilities/timer_bar.js'

document.addEventListener('turbolinks:load', function () {
  const timerBar = document.getElementById('timer_bar')

  if (timerBar) new TimerBar('timer_bar')
})
