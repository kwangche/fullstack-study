//문제 설명
//각에서 0도 초과 90도 미만은 예각, 90도는 직각, 90도 초과 180도 미만은 둔각 180도는 평각으로 분류합니다. 각 angle이 매개변수로 주어질 때 예각일 때 1, 직각일 때 2, 둔각일 때 3, 평각일 때 4를 return하도록 solution 함수를 완성해주세요.
//
//예각 : 0 < angle < 90
//직각 : angle = 90
//둔각 : 90 < angle < 180
//평각 : angle = 180
//제한사항
//0 < angle ≤ 180
//angle은 정수입니다.
//입출력 예
//angle	result
//70	1
//91	3
//180	4
//입출력 예 설명
//입출력 예 #1
//
//angle이 70이므로 예각입니다. 따라서 1을 return합니다.
//입출력 예 #2
//
//angle이 91이므로 둔각입니다. 따라서 3을 return합니다.
//입출력 예 #2
//
//angle이 180이므로 평각입니다. 따라서 4를 return합니다.

function solution(angle) {
    var answer = 0;
    if (angle < 90) {
        answer = 1; // 예각
    } else if (angle === 90) {
        answer = 2; // 직각
    } else if (angle < 180) {
        answer = 3; // 둔각
    } else {
        answer = 4; // 평각
    }
    return answer;
}