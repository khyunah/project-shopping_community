  let count = 3;
  window.onscroll = function () {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
      let toAdd = document.createElement("div");
      toAdd.classList.add("box");
      toAdd.textContent = `${++count}번째 div`;
      document.querySelector(`section`).appendChild(toAdd);
    }
 };