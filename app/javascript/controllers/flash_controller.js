import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    setTimeout(() => {      
      this.dismiss();
    }, 2000);
  }

  dismiss() {    
    // document.getElementById("flash").className = document.getElementById("flash").className.replace(/(?:^|\s)animate__fadeIn(?!\S)/g, 'animate__fadeOut'); 

    // const div = this.element.querySelector('animate__fadeIn');
    // div.classList.replace('animate__fadeIn','animate__fadeOut');

    // this.element.classList.remove(animate__fadeIn); 
    // this.element.classList.add(animate__fadeOut);

    this.element.remove();
  }
}
