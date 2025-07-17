const snacks = ['원카칩', '꿀버터칩', '헛스윙칩', '태양칩', '야채시간'];
const drinks = ['사이다', '콜라', '우유', '물', '커피', '레몬에이드'];

function printArguments(...args) {
  for (const arg of args) {
    console.log(arg);
  }
}

// 1. Spread 구문을 활용해서 snacks와 drinks 배열을 각각 mySnacks와 myDrinks 변수에 복사해 주세요
const mySnacks = [...snacks];
const myDrinks = [...drinks];

mySnacks.splice(2, 3);
myDrinks.splice(1);

// 2. Spread 구문을 활용해서 mySnacks와 myDrinks 순서로 두 배열을 합쳐서 myChoice 변수에 할당해 주세요
const myChoice = [...mySnacks, ...myDrinks];

// 3. Spread 구문을 활용해서 myChoice의 각 요소들을 printArguments 함수의 아규먼트로 전달해 주세요
printArguments(...myChoice);