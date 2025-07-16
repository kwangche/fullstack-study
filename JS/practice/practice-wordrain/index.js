const input = document.querySelector('#input');

function checker() {
  const words = document.querySelectorAll('.word');
  if (words.length === 0) {
    alert('Success!👏');
    if(confirm('retry?')) {
      window.location.reload();
    }
  }
}

// 여기에 코드를 작성하세요

function wordCorrect(event) {
  // Enter 키 체크
  if (event.key === 'Enter') {
    // 데이터 속성과 입력값 비교
    const word = document.querySelector(`[data-word="${input.value}"]`);
    if (word) {
      word.remove();
      checker();
    }
    // 입력값 초기화
    input.value = '';
  }
}

// 이벤트 리스너 등록
input.addEventListener('keydown', wordCorrect);