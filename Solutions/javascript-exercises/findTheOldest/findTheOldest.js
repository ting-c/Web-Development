let findTheOldest = function(people) {

// ** First Solution **

//   oldest = 0;
//   oldestIndex = 0;
//   for (i=0; i < people.length; i++){
//     if (!people[i].hasOwnProperty('yearOfDeath')) {
//       yearOfDeath = new Date().getFullYear();
//     } else {
//       yearOfDeath = people[i].yearOfDeath;
//     };
//
//     yearsOld = yearOfDeath - people[i].yearOfBirth;
//     if (oldest < yearsOld){
//       oldest = yearsOld;
//       oldestIndex = i;
//     };
//   };
// return people[oldestIndex];

// ** With reduce method **

  oldestPerson = people.reduce((oldest, person) => {
    personAge = age(person.yearOfBirth, person.yearOfDeath)
    oldestAge = age(oldest.yearOfBirth, oldest.yearOfDeath)
    return oldestAge < personAge ? person : oldest
  });
return oldestPerson;
};

const age = function(birth, death){
  if (!death) {
    death = new Date().getFullYear();
  }
  return death - birth;
}

module.exports = findTheOldest
