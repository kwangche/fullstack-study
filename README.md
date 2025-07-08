# fullstack-study

## 위클리 페이퍼

- [위클리 페이퍼 링크](https://auspicious-sidecar-86b.notion.site/222d873e3e7f80bbaffdc6a2afcbdd72?v=222d873e3e7f8054ac07000cefe0fb8b)

---

## Git 기본 명령어 정리

### 설정

- `git init`  
  현재 디렉토리를 Git 프로젝트로 초기화

- `git config user.name 'codeit'`  
  사용자 이름 설정

- `git config user.email 'teacher@codeit.kr'`  
  사용자 이메일 설정

- `git config alias.[별명] [커맨드]`  
  커맨드에 별명(alias) 설정

---

### 파일 및 커밋 관리

- `git add [파일명]`  
  특정 파일을 staging area에 추가

- `git add [디렉토리명]`  
  디렉토리 내 모든 변경 파일 staging area에 추가

- `git add .`  
  전체 변경 파일 staging area에 추가

- `git reset [파일명]`  
  staging area에서 파일 제거

- `git status`  
  현재 상태 확인

- `git commit -m "메시지"`  
  staging area의 변경사항 커밋

- `git commit --amend`  
  최신 커밋 수정

---

### 원격 저장소

- `git push -u origin master`  
  최초로 원격 저장소에 푸시

- `git push`  
  변경사항 원격 저장소에 푸시

- `git pull`  
  원격 저장소의 변경사항 가져오기

- `git clone [URL]`  
  원격 저장소 복제

---

### 로그 및 히스토리

- `git log`  
  커밋 히스토리 출력

- `git log --pretty=oneline`  
  한 줄로 커밋 히스토리 출력

- `git show [커밋ID]`  
  특정 커밋의 상세 정보 확인

- `git diff [커밋A] [커밋B]`  
  두 커밋 간의 차이 비교

---

### 브랜치 및 태그

- `git branch [브랜치명]`  
  새 브랜치 생성

- `git checkout -b [브랜치명]`  
  새 브랜치 생성 후 이동

- `git branch -d [브랜치명]`  
  브랜치 삭제

- `git checkout [브랜치명]`  
  브랜치 이동

- `git merge [브랜치명]`  
  브랜치 병합

- `git merge --abort`  
  병합 중 충돌 발생 시 병합 취소

- `git tag [태그명] [커밋ID]`  
  커밋에 태그 추가

---

### 기타

- `git help [명령어]`  
  명령어 공식 메뉴얼 확인

- `git reset [옵션] [커밋ID]`  
  커밋, staging area, working directory 상태 복원  
  - `--soft`: HEAD만 이동  
  - `--mixed`(기본): HEAD + staging area 이동  
  - `--hard`: HEAD + staging area + working directory 이동  
  - 커밋ID 대신 `HEAD^`, `HEAD~3` 등 사용 가능

---

> **참고:**  
> 각 명령어의 자세한 사용법은 `git help [명령어]`로 확인할 수 있습니다.
