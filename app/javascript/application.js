// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



const flashContainer = document.getElementById("flash-container");

flashContainer.addEventListener('click', (e) => {
  if(e.currentTarget.id === "flash-container") {
    e.target.innerHTML = '';
  }
});
