function getRandomElement(arr) {
  const randomIdx = Math.floor(Math.random() * arr.length);
  return arr[randomIdx];
}

console.log('메뉴 고르는 중...');

// const response = await fetch('https://learn.codeit.kr/api/menus');
// const menus = await response.json();
// const randomMenu = getRandomElement(menus);
// console.log(`오늘의 랜덤 메뉴는 ${randomMenu.name}입니다!`);

fetch('https://learn.codeit.kr/api/menus')
  .then((response) => response.json())
  .then((menus) => {
    const randomMenu = getRandomElement(menus);
    console.log(`오늘의 랜덤 메뉴는 ${randomMenu.name}입니다!`);
  })
