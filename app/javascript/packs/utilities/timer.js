class TimerHandler {
  constructor(timerElement) {
    this.timerElement = timerElement;
    this.time = timerElement.dataset.countdown;
  }

  setup() {
    setInterval(() => {
      const hours = Math.floor((this.time % (60 * 60 * 24)) / (60 * 60));
      const minutes = Math.floor((this.time % (60 * 60)) / 60);
      const seconds = Math.floor((this.time % 60) / 1);

      this.timerElement.innerHTML = `${hours} : ${minutes} : ${seconds}`;
      this.time -= 1;

      if (this.time < 0) {
        document.getElementById('submit_question').click();
      }
    }, 1000);
  }
}

document.addEventListener('turbolinks:load', () => {
  const timer = document.getElementById('timer');
  const timerHadler = new TimerHandler(timer);
  timerHadler.setup();
});
