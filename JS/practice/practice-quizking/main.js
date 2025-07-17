const quiz1 = {
  question: '다음 중 스승의 날과 생일이 같은 인물은 누구일까요?',
  example: [ '율곡 이이', '퇴계 이황', '세종대왕', '신사임당'],
  answer: 3,
  solution: '훈민정음 창제 등 우리나라 문화와 교육 발전에 남긴 업적이 가장 큰 인물이라는 평가와 함께, 이 시대의 스승이 세종대왕처럼 존경받았으면 하는 바람으로 세종대왕의 탄생일이 스승의 날로 지정되었습니다.',
};

const quiz2 = {
  question: '다음 중 희노애락에 속하지 않는 것은 무엇일까요?',
  example: ['사랑', '기쁨', '즐거움'],
  answer: 1,
  solution: '희노애락에서의 애를 사랑 애(愛)라고 자칫 오해할 수가 있지만, 희노애락의 애는 슬플 애(哀)입니다. 기쁨은 기쁠 희(喜), 즐거움은 즐거울 락(樂)에 담겨 있습니다.',
};

function printQuiz({ question, example }) {
  let exMsg = '';
  try{
    for (let i = 0; i < example.length; i++) {
      exMsg += `${i + 1}. ${example[i]}  `;
    }
    console.log(question);
    console.log(exMsg);
  }catch(err){
    console.log(err.name);
  }
  
}

// 테스트 코드
printQuiz(quiz1);
printQuiz(1);
printQuiz("");
printQuiz({});
printQuiz(quiz2);