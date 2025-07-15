const toDoList = document.querySelector('#to-do-list');
const items = toDoList.children;

// 1. updateToDo 함수를 수정하세요
function updateToDo(event) {
  event.target.classList.toggle('done');
}

// 2. 반복문을 활용해서 각 li태그에 이벤트 핸들러를 등록하세요
for (let item of items) {
  item.addEventListener('click', updateToDo);
}

// 테스트 코드
items[2].removeEventListener('click', updateToDo);