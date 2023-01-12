export class ProgressBar {
  constructor(progressBarId) {
    this.progressBar = document.getElementById(progressBarId)
    this.progressBarValue = document.querySelector('.progress-bar-value')
    this.currentQuestionNum = this.progressBarValue.dataset.currentQuestionNum
    this.questionsNum = this.progressBarValue.dataset.questionsNum
    this.progress = document.querySelector('.progress-bar')

    this.updateBar()
  }

  updateBar() {
    const Width = ((this.currentQuestionNum - 1) / this.questionsNum) * 100

    this.progress.style.width = '' + Width + '%'
    this.progressBarValue.textContent = '' + Width + '%'
  }
}
