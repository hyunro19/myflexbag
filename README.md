# MyFlexBag_스프링프레임워크 활용 쇼핑몰구축

<br><br>

### [👜AWS로 배포된 MyFlexBag 방문하기](http://52.79.157.226:8080/myflexbag)

### [📝Notion에서 프로젝트 보고서 읽기](https://www.notion.so/MyFlexBag_-Ver1-1-39c1f1fa06ec4104806f8c20c39a5c04)

<br><br>

### 목차

1. 프로젝트 개괄
2. 사용기술 및 시스템구성
3. 데이터베이스 구조 (ERD)
4. 사이트맵
5. 상세화면 및 기능

<br><br>

---

# 1. 프로젝트 개괄

### 1.1 왜 쇼핑몰인가

1. 기본적으로 모든 사이트는 게시판 형식
2. 쇼핑몰, 티켓예매 사이트도 상품이 각 게시판에 게시글로 올라간 형태
3. 쇼핑몰은 게시판과 같은 기능 뿐만 아니라 장바구니. 결제기능. 주문내역 등의 내용도 구현 필요

*→ 쇼핑몰은 대부분의 웹 사이트에 적용되는 가장 대표적인 구조*

<br>

### 1.2 프로젝트 인원(총 4명) 및 역할분담

- A(본인) : `상품`, `주문`, `상품리뷰` + (Ver1.1 기능추가, `배포` )

- B : 장바구니, 주문

- C : 장바구니, 프로젝트발표

- D : 회원(멤버십, 마이페이지), 문의

<br><br>

---

# 2. 사용기술 및 시스템구성

### 2.1 사용 기술

![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd4966fd1-b449-4cba-87e3-df1187c8f6a0%2Fsw_used_ver1.1.png?table=block&id=36a445eb-a720-42e2-8109-f65309cf9de0&width=1890&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd4966fd1-b449-4cba-87e3-df1187c8f6a0%2Fsw_used_ver1.1.png?table=block&id=36a445eb-a720-42e2-8109-f65309cf9de0&width=1890&cache=v2)

1. Web Front : `HTML5` , `CSS3.0`, `JavaScript(ESMA6)`, `Bootstrap`, `jQuery(1.12.4)`
2. Web Server :  `Java(jdk1.8)`, `Spring Framework(4.2.5)`, `MyBatis(3.2.3)`, `ApacheTomcat(9.0)`
3. DBMS : `MySQL(mysql57-server.x86_64)`
4. 개발환경 : `Eclipse(2019-03)`, `Maven(4.0.0)`
5. 배포환경 : `Amazon EC2 (t.micro Plan)`, `Amazon Linux`

<br><br>

### 2.2 시스템 구성도

![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe8177e51-100e-46ca-84fe-206ec7fe05ae%2FsystemStructure_ver1.1.png?table=block&id=40072757-4467-4d07-bf6a-8186ee1904a2&width=1970&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe8177e51-100e-46ca-84fe-206ec7fe05ae%2FsystemStructure_ver1.1.png?table=block&id=40072757-4467-4d07-bf6a-8186ee1904a2&width=1970&cache=v2)<br><br>

---

# 3. 데이터베이스 구조 (ERD)

![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb453d2f2-0cc2-4255-bd47-dd84d741c49b%2FERD_.png?table=block&id=9367b412-c851-4163-808a-21da2470ed1f&width=4130&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb453d2f2-0cc2-4255-bd47-dd84d741c49b%2FERD_.png?table=block&id=9367b412-c851-4163-808a-21da2470ed1f&width=4130&cache=v2)

* 상품 테이블 `카테고리`, `사이즈`, `색상`, `브랜드`, `소재`, 주문 테이블 `결제수단`, `배송상태` , 문의 테이블 `글종류` 등은 유지 보수를 위해 별도의 테이블로 구성하여 외래키로 설정해야하지만 개발의 편의성을 위해 개별 값을 적용하였다.

<br><br>

---

# 4. 사이트맵

![![img](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F77dbe3b7-5dc3-4d19-92c6-d1b34f5d0176%2Fsitemap.png?table=block&id=d3a3156b-ce4c-4219-a1d5-23b3414b6161&width=3840&cache=v2)](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F77dbe3b7-5dc3-4d19-92c6-d1b34f5d0176%2Fsitemap.png?table=block&id=d3a3156b-ce4c-4219-a1d5-23b3414b6161&width=3840&cache=v2)

* 본인 담당 영역 : `상품`, `주문(주문하기, 주문내역, 주문상세내역)`, `관리자메뉴(상품등록·수정·삭제)` 

<br><br>

---

# 5. 상세화면 및 기능

[📝Notion으로 작성된 프로젝트 보고서에서 읽어보실 수 있습니다.](https://www.notion.so/MyFlexBag_-Ver1-1-39c1f1fa06ec4104806f8c20c39a5c04)

> **세부 목차**
    5.1 메인화면
    5.2 상품 (리스트 / 상세)
    5.3 게시판 (문의 / 리뷰)
    5.4 멤버십 (회원가입 / 로그인)
    5.5 주문 (장바구니 / 주문·결제 / 주문완료)
    5.6 마이페이지 (주문·배송 조회 / 내가 쓴 글 / 회원정보수정)

<br><br><br><br>