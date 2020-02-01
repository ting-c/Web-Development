function add (a,b) {
	return a+b;
};

function subtract (a,b) {
	return a-b;
};

function sum (array) {
	total = 0;
	for (i=0; i < array.length ; i++){
		total += array[i];
	};
	return total;

};

function multiply (array) {
	product = 1;
	for (i=0; i < array.length ; i++){
		product *= array[i];
	};
	return product;
};

function power(a,b) {
	return a ** b;
};

function factorial(n) {
	if (n == 0){
		return 1;
	};
	for (i = n-1; i > 0 ; i--){
		n *= i;
	};
	return n;
};


module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}
