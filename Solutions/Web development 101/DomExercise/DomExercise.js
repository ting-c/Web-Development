
const container = document.querySelector('#container');

const content = document.createElement('div');
content.classList.add('content');
content.textContent = 'This is the glorious text-content!';

const paragraph = document.createElement('p');
paragraph.classList.add('paragraph');
paragraph.textContent = "Hey I'm red!";
paragraph.style.cssText = 'color: red';

const heading3 = document.createElement('h3');
heading3.classList.add('heading3');
heading3.textContent = "I'm a blue h3!";
heading3.style.cssText = "color: blue";

const content2 = document.createElement('div');
content2.classList.add('content2');
content2.style.border = 'solid';
content2.style.borderColor = "black";
content2.style.backgroundColor = "pink";

const heading1 = document.createElement('h1');
heading1.classList.add('heading1');
heading1.textContent = "I'm in a div";

const paragraph1 = document.createElement('p');
paragraph1.classList.add('paragraph1');
paragraph1.textContent = "ME TOO!";

container.appendChild(content);
container.appendChild(paragraph);
container.appendChild(heading3);
content2.appendChild(heading1);
content2.appendChild(paragraph1);
container.appendChild(content2);
