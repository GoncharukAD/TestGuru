export class TimerBar {
  constructor(timerBarId) {
    this.timerBar = document.getElementById(timerBarId)
    this.timerBarValue = this.timerBar.querySelector('.timer-bar-value')
    this.testPassageId = this.timerBarValue.dataset.testPassageId
    this.endTime = this.timerBarValue.dataset.endTime
    this.form = document.getElementById('choose_answers_form')
    this.сreateBar()
  }

  сreateBar() {
    this.timerBarValue.classList.remove('hide')

    const countDownDate = new Date(this.endTime).getTime()

    this.interval = setInterval(() => this.updateBarValue(countDownDate), 1000)
  }

  updateBarValue(countDownDate) {
    let now = new Date().getTime()

    let distance = countDownDate - now

    let days = Math.floor(distance / (1000 * 60 * 60 * 24))
    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
    let seconds = Math.floor((distance % (1000 * 60)) / 1000)

    this.timerBarValue.innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s "

    if (distance < 0) {
      clearInterval(this.interval)

      this.form.submit()
    }
  }
}
