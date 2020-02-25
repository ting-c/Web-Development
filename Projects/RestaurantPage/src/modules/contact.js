function contact(){
  const contact = document.querySelector("#Contact");
  let heading0 = document.createElement("h3");
  contact.appendChild(heading0);
  contact.querySelector("h3").textContent = "For Reservations Call :";
  let contactTextNode = document.createElement("p");
  let contactText = `03141 59265`;
  contactTextNode.textContent = contactText;
  contact.appendChild(contactTextNode);

  let heading01 = document.createElement("h3");
  heading01.textContent = "Address";
  contact.appendChild(heading01);
  let address = document.createElement("p");
  address.textContent = `314 Panda Street\n
                          Bamboo City\n
                          159265`;
  contact.appendChild(address);

  let img = document.createElement("img");
  img.setAttribute("src", "../img/table-setting-2098125_960_720.jpg");
  img.setAttribute("width", "304");
  img.setAttribute("height", "228");
  contact.appendChild(img);
}

export default contact;
