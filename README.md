##  RAILS
### 1. 기본 설치
    * C9에서 사용하기 위해 cd ..로 최상위로 이동한다.
    * 설치
        - gem install rails -v 5.0.6 : rails 5.0.6버젼 설치
        - rvm install 2.4.1 : version manager를 이용해 ruby 2.4.1설치
        - rvm default 2.4.1 로 기본 버젼 지정 가능
        - rails _5.0.6_ new test_app : 프로젝트 생성(test_app이름으로)
    * 서버 동작시
        - 우상단의 Run Project는 workspace를 기반으로 되어 있음
        - rails s -p $PORT -o $IP : 실행
### 2. 기본
    * gem
        - ruby가 사용하는 library
    * bundler : 설치 --> gem install bundler
        - 내 프로젝트에 사용될 모든 gem을 자동으로 설치함
        - 해당 gem은 Gemfile에 명시한다.
        - Gemfile에 사용할 gem을 명시한 이후 터미널에 다음 명령어 입력
            >> bundle install 
            >> 해당 명령어는 사용할 라이브러리를 추가한 이후에도 반드시 해당 명령어를 실행
            >> 사용할 gem을 지우더라도 해당 명령어를 다시 수행해야 한다. 그래야 삭제됨
    * rails 파일
        - 실행되는 것이 모두 분리되어 있음.
        - test_app/app
            >> models, views, controllers
        - config/routes.rb : action에 따른 어떤 logic을 수행할지 명시함
            >> 클라이언트의 요청이 들어오면 어떤 controller의 action을 수행할지 지정함.
            >> 아래와 같이 설정이 된다.
                --> class __controller
                        def action_name
                        end
                    end
        - db/ : ORM이용해 db 설정
        - log : 로그파일. 각종 로그가 저장됨
        - public : 외부에서 모두가 접근가능한 폴더
        - test : rails의 프레임워크는 TDD(Test Driven Development)에 최적화되어 있음. 즉, test에 어떤 기능을 구현할지 명시할 수 있다.
        - tmp : 임시파일 저장
        - vendor : template 지정
        - Gemfile : gem관리
        - Gemfile.lock : 설치된 dependencies 확인
    * rails client - server 요청 관계
        - 하단 이미지 확인
    * cf)ORM
        - ORM : db에 만들 table의 column등의 설정진행
        - ORM : Object Relational Mapping : 객체와 관계형 DBMS간의 매핑을 지원해주는 Framework
![이미지](./readme_img/mvc.JPG)