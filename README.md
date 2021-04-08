# Project 1) todo-list

### 🐣Team17 - 비타지(BeTasy)

### 🐣팀원 :  [Beemo] [Tami] [Daisy]

### React Level

- [Beemo] : 🟦⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1
- [Tami] : 🟦⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1
- [Daisy] : 🟦⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1

### BE Level

- [Beemo] : 🟨⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1
- [Tami] :🟨⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1
- [Daisy] :🟨⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️ Lv.1

### 팀 사진

<img width="392" alt="스크린샷 2021-04-08 오후 11 38 41" src="https://user-images.githubusercontent.com/56783350/114046129-8e659a00-98c3-11eb-90cc-ba4d51056aa0.png">

----



## BeTasyTo-do List

https://www.notion.so/BeTasy-To-do-List-825c3a20680f4739b9b10dc76d39821e



## 팀 규칙

+ 브랜치 전략, 깃 컨벤션 [링크](https://github.com/ink-0/todo-list/wiki/%EA%B9%83-%EC%BB%A8%EB%B2%A4%EC%85%98)
+ styled components 컨벤션 [링크](https://github.com/ink-0/todo-list/wiki/styled-components-%EC%BB%A8%EB%B2%A4%EC%85%98)
+ 팀 회의시간 : 아침10시, 점심2시, 저녁9시에 한번씩 

### Git Branch 전략

<img width="795" alt="스크린샷 2021-04-08 오후 11 39 43" src="https://user-images.githubusercontent.com/56783350/114046296-b35a0d00-98c3-11eb-9639-b2743dad1ff1.png">


## Git 협업 방식 습득

- Issues, Project 사용법 습득, 협업시 각 기능을 어떻게 활용하면 좋을지 논의 및 test 용 Issues 발행 
<img width="732" alt="스크린샷 2021-04-08 오후 11 40 02" src="https://user-images.githubusercontent.com/56783350/114046354-bead3880-98c3-11eb-8dd6-80d267e2deab.png">

 
## 회의 내용 및 협업 과정

1. [개인] 리액트 공부

2. [페어] 컴포넌트 제작하기

   ``` 
   App
   └ Container
     └ Wrap
       └ Title
   ```

   + 위와같이 점점 폴더의 depth가 깊어지는 문제 발생 , scss BEM depth도 깊어짐..

   ![image](https://user-images.githubusercontent.com/61257242/114029736-c9ac9c80-98b4-11eb-943e-b8bd9a46b88b.png)

3. 폴더구조를 개선하기 위해 아토믹 디자인 패턴(Atomic Design Pattern)을 도입하기로 결정

4. scss Bem depth가 깊어지는걸 방지, 네이밍 중복을 방지하기 위한 styled components 도입하기로 결정

 

## Atomic Design Pattern

![img](https://lh5.googleusercontent.com/SmBeAr_oknzr7KDSIVYygnJRU1Oo7NX_gUUBVbcJS4XgEzdzDqLL6hyojJ1ztqQK4L_1FjA5XHNuFSnbQfZ0iFKa6bL1ApJKRAAf5OO2K9zr-BqzZ8-h4AUvX6jHC-FXevZnSIjwx5U)

### Atomic Design Pattern 기반으로 재설계 과정

1. Atomic Design Pattern이 무엇인지 함께 학습
2. Atomic Design Pattern을 도입한 리액트 개발 레퍼런스를 조사하여 프로젝트에 어떻게 도입하면 좋을지 논의

3. UI를 Atoms - Molecules - Organisms 로 구분하여 컴포넌트 구조를 재설계
4. Google 프레젠테이션을 이용하여 UI를 Atoms - Molecules - Organisms로 각각 나누고, 폴더명을 정함



### 개선된 파일 구조

### Before

<img width="215" alt="스크린샷 2021-04-08 오후 11 44 31" src="https://user-images.githubusercontent.com/56783350/114047091-60cd2080-98c4-11eb-89bb-8b7d946885ee.png">

### After
<img width="471" alt="스크린샷 2021-04-08 오후 11 40 36" src="https://user-images.githubusercontent.com/56783350/114046471-d389cc00-98c3-11eb-924f-e1910c1f3ac4.png">


### 컴포넌트 정의하기

**Atoms**

- 해당 설계의 최소 단위
- form, input ,button 같은 HTML의 태그나 최소의 기능을 가진 기능의 커스텀 태그 컴포넌트

<img width="923" alt="스크린샷 2021-04-08 오후 11 41 11" src="https://user-images.githubusercontent.com/56783350/114046565-e8fef600-98c3-11eb-8577-24e3ad4e917b.png">


**Molecules**

- Atom들을 최소의 역할을 수행할 수 있게 합한 그룹입력을 받기 위한 form, label, input 등

<img width="913" alt="스크린샷 2021-04-08 오후 11 41 25" src="https://user-images.githubusercontent.com/56783350/114046609-f1573100-98c3-11eb-9924-ea5d2657a6bc.png">


**Organisms**

- 배치를 위한 layout 단위로 하나의 인터페이스를 형성하는 그룹header, navigation 등
 <img width="900" alt="스크린샷 2021-04-08 오후 11 41 40" src="https://user-images.githubusercontent.com/56783350/114046643-f9af6c00-98c3-11eb-9b5b-2ae60e4b5e26.png">






## BE

+ API 구조 등의 백엔드 구성은 프론트 작업이 끝난 후에 할 예정.. (아마 다음주 부터..)


