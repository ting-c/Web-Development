function menu(){
  const menu = document.querySelector("#Menu");
  let heading1 = document.createElement("h3");
  heading1.textContent = "Starters";
  menu.appendChild(heading1);
  let starterTextNode = document.createElement("p");
  let starterText = `Traditional Crab Rangoon ------- £ 8.10
                      \n Fried Shrimp Balls ------------- £ 7.20
                      \n Lotus Leaf Wraps -------------- £ 8.50 \n`;
  starterTextNode.textContent = starterText;
  menu.appendChild(starterTextNode);
  //image
  let img1 = document.createElement("img");
  img1.setAttribute("src", "../img/cold-noodles-3453218_1920.jpg")
  img1.setAttribute("width", "304")
  img1.setAttribute("height", "228");
  menu.appendChild(img1);

  let heading2 = document.createElement("h3");
  heading2.textContent = "Lunch";
  menu.appendChild(heading2);
  let lunchTextNode = document.createElement("p");
  let lunchText = `Hoeddeok (sweet syrupy pancakes) ------- £ 8.10
                    \n Bulgogi (marinated beef barbecue) ------- £ 8.10
                    \n Samgyeopsal (pork strips) ------- £ 8.10
                    \n Japchae (stir-fried noodles) ------- £ 8.10
                    \n Kimchi (fermented vegetables) ------- £ 8.10 \n`
  lunchTextNode.textContent = lunchText;
  menu.appendChild(lunchTextNode);
  //image
  let img2 = document.createElement("img");
  img2.setAttribute("src", "../img/sunny-side-up-632217_1920.jpg")
  img2.setAttribute("width", "304")
  img2.setAttribute("height", "228");
  menu.appendChild(img2);

  let heading3 = document.createElement("h3");
  heading3.textContent = "Sides";
  menu.appendChild(heading3);
  let sideTextNode = document.createElement("p");
  let sideText = `Spinach Ohitashi (Japanese Spinach Salad) ------- £ 5.10
                    \n Spinach Ohitashi (Japanese Spinach Salad) ------- £ 6.80
                    \n Ramen Egg (Ajitsuke Tamago) ------- £ 7.30
                    \n Tamagoyaki (Japanese Rolled Omelette) ------- £ 4.90
                    \n Salmon Sashimi  ------- £ 8.10 `
  sideTextNode.textContent = sideText;
  menu.appendChild(sideTextNode);
  //image
  let img3 = document.createElement("img");
  img3.setAttribute("src", "../img/sushi-2856545_960_720.jpg")
  img3.setAttribute("width", "304")
  img3.setAttribute("height", "228");
  menu.appendChild(img3);
}

export default menu;
