function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

mysteryScoping1();

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
    debugger
}
mysteryScoping2();

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
        deugger
    }
    console.log(x);
}
mysteryScoping3();

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}
mysteryScoping4();

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}
mysteryScoping5();



function madLib(verb, adj, noun) {
    return `we shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}


function fizzBuzz(array) {
    const fizzedB = [];

    array.forEach(el => {
        if ((el % 3 === 0) ^ (el % 5 === 0)) {
            fizzedB.push(el);
        }
    });

    return fizzedB;
}

function isPrime(n) {
    if (n < 2) { return false; }

    for (let i = 2; i < n; i++) {
        if (n % i === 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrimes(n) {
    let i = 2;
    let sum = 0;
    let numPrimes = 0;

    while (numPrimes < n) {
        if (isPrime(i)) {
            sum += i;
            numPrimes++;
        }
        i++;
    }
    return sum;
}
