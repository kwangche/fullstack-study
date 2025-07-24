export async function getMenus() {
  // 여기에 코드를 작성하세요.
  try {
    const response = await fetch('https://learnnnnn.codeit.kr/api/menus');
    const menus = await response.json();
    return menus;
  } catch(error) {
    console.log('데이터를 가져오지 못했습니다 :(');
    return null;
  } finally {
    console.log('getMenus() 함수가 끝났습니다.');
  }
}
