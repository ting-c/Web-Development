const display = document.querySelector(".display");
const bookTitle = document.querySelector("#title");
const authorName = document.querySelector("#author");
const numberOfPages = document.querySelector("#pages");
const readOrNot = document.querySelector("input[name='read']:checked");
const scrollLeft = document.querySelector("#scrollLeft");
const scrollRight = document.querySelector("#scrollRight");

if (typeof(Storage) !== "undefined") {
  myLibrary = JSON.parse(localStorage.getItem("storedLibrary"));
  console.log(myLibrary);
  if (!myLibrary) {
    myLibrary = []
  };
} else {
  myLibrary = [
    {title: "Linear Algebra", author: "Hoffman & Kunze", pages: "416", read: true, date: "Wed Nov 11 2015 12:00:00"},
    {title: "Fermat's Last Theorem", author: "Simon Singh", pages: "358", read: true, date: "Sun May 4 2014 09:00:00"},
    {title: "The Art of Statistics", author: "David Spiegelhalter", pages: "448", read: false, date: "Sat Dec 28 2020 14:00:00"},
    {title: "Calculus: Vol I", author: "Apostol", pages: "666", read: true, date: "Sat Feb 2 2020 15:30:00"}
  ];
}


function storeLibrary(){
  let myLibrary_serialized = JSON.stringify(myLibrary);
  localStorage.setItem("storedLibrary", myLibrary_serialized);
}

function openTab(event, tab) {

  // Get all elements with class="tabcontent" and hide them
  let content = document.querySelectorAll(".content");
  content.forEach(
    function(currentContent) {
      currentContent.style.display = "none";
    }
  );
  // Get all elements with class="tablinks" and remove the class "active"
  let tablinks = document.querySelectorAll(".tablinks");
  tablinks.forEach(
    function(currentTab) {
      currentTab.className = currentTab.className.replace(" active", "");
    }
  );
  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(tab).style.display = "block";
  event.currentTarget.className += " active";
}

document.querySelector("#libraryTab").click(); // show default tab

function Book(title, author, pages, read, dateAdded) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.read = read;
  this.date = dateAdded;
}

scrollLeft.onclick = function moveLeft() {
  display.scrollLeft -= 200;
}

scrollRight.onclick = function moveRight() {
  display.scrollLeft += 200;
}


function addBookToLibrary(){
  if (!bookTitle.value || !authorName.value ||
     !numberOfPages.value || !readOrNot.value) {
    return
  };
  let newDate = new Date().toString();
  let date = new Date().toString().slice(0,24);
  newUser = new Book(bookTitle.value,
    authorName.value, numberOfPages.value,
    readOrNot.value, date);
  myLibrary.push(newUser);
  console.log(newUser);
  console.log(myLibrary);
  render();
  storeLibrary();
}

function render() {
  display.innerHTML = "";
  for (let i=0; i<myLibrary.length; i++){
    book = myLibrary[i];
    if (!book.read) {
      read = "Not Read";
    } else{
      read = "Read";
      }
    output = `${book.title}<br>
              by ${book.author}<br>
              ${book.pages} pages<br>
              ${read}<br>
              Added on ${book.date}<br>`

    let newDiv = document.createElement("div");
    let removeButton = document.createElement("button");
    let readButton = document.createElement("button");
    readButton.className = "readButton";
    removeButton.className = "removeButton";
    newDiv.className = "card";
    removeButton.innerHTML = "Remove";
    readButton.innerHTML = "Read";
    readButton.setAttribute("data-index", i);
    readButton.onclick = function toggleRead(){
      if (!myLibrary[i].read){
        myLibrary[i].read = true;
      } else {
        myLibrary[i].read = false;
      }
      console.log(myLibrary[i].read);
      render();
      storeLibrary();
    }
    removeButton.setAttribute("data-index", i);
    removeButton.onclick = function removeBook(){
      myLibrary.splice(i,1);
      render();
      storeLibrary();
    }
    newDiv.innerHTML = output;
    newDiv.appendChild(removeButton);
    newDiv.appendChild(readButton);
    display.appendChild(newDiv);

  }

}

render();
