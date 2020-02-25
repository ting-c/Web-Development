function about(){
  const about = document.querySelector("#About");
  let heading = document.createElement("h3");
  heading.textContent = `Panda Egg Restaurant`;
  about.appendChild(heading);
  let aboutTextNode = document.createElement("p");
  let aboutText = `We bring together a variety of authentic oriental cuisine including\n
                  Chinese, Korean and Japanese.`;  
  aboutTextNode.textContent = aboutText;
  about.appendChild(aboutTextNode);

  let heading2 = document.createElement("h3");
  heading2.textContent = `Opening Times`;
  about.appendChild(heading2);
  let openingTimesNode = document.createElement("p");
  let openingTimes = `MON-FRI 12pm - 3pm (Last order 2:30) / 6pm - 11pm (Last order 10:30pm)
  \n SAT 12pm - 11pm (Last order 10:30pm)
  \n SUN 12pm - 10:30pm (Last order 10pm)`;
  openingTimesNode.textContent = openingTimes;
  about.appendChild(openingTimesNode);


  let img1 = document.createElement("img");
  img1.setAttribute("src", "../img/food-3354305_1920.jpg");
  img1.setAttribute("width", "304");
  img1.setAttribute("height", "228");
  about.appendChild(img1);

  let img2 = document.createElement("img");
  img2.setAttribute("src", "../img/background-food-1050813_1920.jpg");
  img2.setAttribute("width", "304");
  img2.setAttribute("height", "228");
  about.appendChild(img2);

  let img3 = document.createElement("img");
  img3.setAttribute("src", "../img/image-951834_960_720.jpg");
  img3.setAttribute("width", "304");
  img3.setAttribute("height", "228");
  about.appendChild(img3);
}

export default about;
