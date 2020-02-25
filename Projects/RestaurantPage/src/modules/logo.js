function logo(){
  const content = document.querySelector("#content");
  const logo = document.createElement('div');
  logo.setAttribute("id", "logo");
  const logoImg = document.createElement('img');
  logoImg.src = "../img/panda-egg.png";
  logo.appendChild(logoImg);
  content.appendChild(logo);
}

export default logo;
