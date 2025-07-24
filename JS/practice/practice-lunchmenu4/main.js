import { getMenus } from './asyncFunctions.js';

function randomElement(arr) {
  const randomIdx = Math.floor(Math.random() * arr.length);
  return arr[randomIdx];
}

console.log('메뉴 고르는 중...');

const menus = await getMenus();

if (menus) {
  const randomMenu = randomElement(menus);
  console.log(`오늘의 랜덤 메뉴는 ${randomMenu.name}입니다!`);
}
