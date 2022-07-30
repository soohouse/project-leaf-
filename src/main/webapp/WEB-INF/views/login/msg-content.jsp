<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 쪽지 내용 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/msg-content.css">

<!-- 모달 CSS -->
<style>

    /* 모달 배경 */
    .modal {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
    background-color: rgba(0, 0, 0, 0.4);
    }
    
    /* 모달 전체 박스 */
    .modal-box {
        margin: 100px auto;
        background-color: white;
        width: 800px;
        height: 500px;
        border-radius: 20px;
        border: 1px solid rgb(190, 190, 190);
    }
    
    /* 모달 위에 남색 박스 */
    .modal-top-box {
        background-color: rgb(20, 59, 81);
        width: 100%;
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        color: white;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        border-bottom: 1px solid rgb(190, 190, 190);
    }
    /* 모달위 텍스트 */
    .modal-top-text {
        align-items: center;
        position: relative;
        top: 10px;
        font-size: 15px;
    }
    
    /* 모달 삭제 버튼 */
    .modal-delete {
        float: right;
        top: -15px;
        right: 10px;
        position: relative;
        font-size: 10px;
    }
    /* 모달 삭제 버튼 크기 */
    svg.delete-x {
        width: 30px;
        height: auto;
    }

    .modal-delete:hover {
        background-color: rgb(24, 71, 98);
    }
    /* 모달 삭제 버튼 X박스 */
    .modal-xbox {
        background-color: none;
        width: 40px;
        height: auto;
    }

    /* 모달 내용 */
    .modal-content {
        padding: 10px;
    }

</style>
</head>
<body>
	
    <!-- 모달창띄우는 버튼 -->
    <button class="modal-btn-open-popup">Modal 띄우기</button>

    <!-- 모달창(배경까지) -->
    <div class="modal">
        
        <!-- 모달창 휜색남색 -->
        <div class="modal-box">
            
            <!-- 모달 위에 남색박스 -->
            <div class="modal-top-box">
                <div class="modal-top-text">쪽지 내용</div>
                <div class="modal-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" fill="currentColor" class="bi bi-x-lg modal-xbox delete-x" viewBox="0 0 16 16">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                </div>
            </div>
            
            <!-- 모달 내용 (이 안에 모달 내용을 넣으면 됩니다)-->
            <div class="modal-content">
                
                <div class="msg-content-box">
                    <table border="0" class="msg-table">
                        <thead>
                            <td class="msg-color">보낸이</td>
                            <td>(주) 그린컴퍼니</td>
                            <td class="msg-color">날짜</td>
                            <td>2022-02-02</td>
                        </thead>
                        <tr></tr>
                        <td class="msg-color">내용</td>
                        <td colspan="3">
                            내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들
                            내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들
                            내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들내용들
                        </td>
                    </table>
                    <div class="msg-btn">
                        <input type="submit" value="삭제" class="msg-delete">
                        <input type="submit" value="목록" class="msg-list">
                    </div>
                </div>

            </div>
            <!--모달 내용 끝-->
            
        </div>

    </div>
	
</body>
</html>
<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.modal-btn-open-popup');
    const mdelete = document.querySelector('.modal-delete');

    btnOpenPopup.addEventListener('click', () => { /* class가 modal-btn-open-popup인 버튼을 클릭하면 이벤트가 발생한다. */
        modal.style.display = 'block'; /* 클래스가 modal의 display거 block으로 변경된다. */
    });

    mdelete.addEventListener('click', () => { /* class가 modal-delete인 버튼을 클릭하면 이벤트가 발생한다. */
        modal.style.display = 'none'; /* 클래스가 modal의 display거 none으로 변경된다. */
    });

</script>