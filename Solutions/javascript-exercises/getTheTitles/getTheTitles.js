const getTheTitles = function(arr) {
  newArr = []
  arr.forEach(function (arrItem){
    var title = arrItem['title'];
    newArr.push(title);
  });
  return newArr;
}

module.exports = getTheTitles;
