function tabLinks() {

  const content = document.querySelector("#content");

  let tab = document.createElement('div');
  tab.className = "tab";
  content.appendChild(tab);

  const tabLinks = ['About', 'Menu', 'Contact'];

  // create tablinks
  for (let link in tabLinks){
    let tablink = document.createElement('div');
    tablink.className = "tablinks";
    tablink.setAttribute("id", tabLinks[link]+"Tab")
    tablink.textContent = tabLinks[link];
    tablink.addEventListener("click", function() {
      let tabcontent = document.querySelectorAll(".tabcontent");
      for (let i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      };

      let tablinks = document.querySelectorAll(".tablinks");
      for (let i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
      }

      document.getElementById(tabLinks[link]).style.display = "block";
      event.currentTarget.className += " active";
    }
    );
    tab.appendChild(tablink);
  }

// create tabcontent
  for (let link in tabLinks){
    let tab = document.createElement('div');
    tab.className = "tabcontent";
    tab.setAttribute("id", tabLinks[link]);
    content.appendChild(tab);
  }

  // Open default page
  document.querySelector("#AboutTab").click();
}



export default tabLinks;
