class ProgressBarHandler {
  constructor(progressBar) {
    this.progressBar = progressBar;
    this.numberOfQuestions = progressBar.dataset.numberOfQuestions;
    this.currentIndex = progressBar.dataset.indexNumber;
  }

  setup() {
    const percent = 100 / this.numberOfQuestions;
    this.progressBar.style.width = `${percent * this.currentIndex}%`;
  }
}

document.addEventListener('turbolinks:load', () => {
  const progressBar = document.getElementById('progress-bar');
  const progressBarHandler = new ProgressBarHandler(progressBar);
  progressBarHandler.setup();
});
