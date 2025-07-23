// 여기에 코드를 작성하세요.
async function fetchMenus() {
  const response = await fetch('https://learn.codeit.kr/api/menus');
  const data = await response.json();
  console.log(data);
}

fetchMenus();