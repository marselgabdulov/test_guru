document.addEventListener('turbolinks:load', () => {
  const progressBar = document.getElementById('progress-bar');
  const numberOfQuestions = progressBar.dataset.numberOfQuestions;
  const currentIndex = progressBar.dataset.indexNumber;

  const percent = Math.round(100 / numberOfQuestions);
  progressBar.style.width = `${percent * currentIndex}%`;
});
