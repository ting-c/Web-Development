const ftoc = function(f) {
c = (f-32)* 5/9;
c = c.toFixed(1);
c = parseFloat(c);
return c;
}

const ctof = function(c) {
f = (9/5*c)+32;
f = f.toFixed(1);
f = parseFloat(f);
return f;
}

module.exports = {
  ftoc,
  ctof
}
