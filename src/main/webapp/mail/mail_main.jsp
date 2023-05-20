<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메일함</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="../js/summernote/summernote-lite.js"></script>
  <script src="../js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="../css/summernote/summernote-lite.css">
  <style>
    .right_main {
      position: relative;
      display: inline-table;
      width: 100%;
      height: 730px;
    }
    
    .mail_toolbar {
      background-color: burlywood;
      position: relative;
      display: flex;
      flex-direction: column;
      top: auto;
      right: auto;
      left: auto;
      display: flex;
    }
    
    .top_menu {
      display: flex;
      flex-direction: row-reverse;
      background: #9bffff;
    }
    
    .write_mail {
      text-align: center;
      margin-left: 10px;
      margin-top: 10px;
    }
    
    .mail_gruop>ul {
      list-style: none;
    }
    
    #mail_list {
      display: inline-flex;
      align-content: flex-start;
      flex-direction: column;
      flex-wrap: wrap;
      justify-content: space-evenly;
      flex-direction: row;
      white-space: nowrap;
    }
    
    #mail_list li {
      list-style: none;
      margin-left: 30px;
      white-space: nowrap;
      flex-shrink: 0;
    }
    
    .mail_gruop>ul>li {
      padding-top: 10px;
      margin-top: 15px;
    }
    
    th {
      white-space: nowrap;
    }
    
    a {
      text-decoration: none;
    }
    
    div#right_window {
      position: relative;
      top: 15px;
      left: 230px;
    }
  </style>
  <script>
    $(document).ready(function() {
      var isMailWriteLoaded = false;

      // 버튼 클릭 이벤트 핸들러 등록
      $("#mail_list li").on("click", handleButtonClick);
      $("#write, #me_write").on("click", handleWriteButtonClick);

      function handleButtonClick() {
        var buttonId = $(this).attr("id");

        switch (buttonId) {
          case "inbox":
            loadPage("mail_inbox.jsp");
            break;
          case "my_inbox":
            loadPage("my_mail_inbox.jsp");
            break;
          case "sendMailBox":
            loadPage("mailSendBox.jsp");
            break;
          case "drafts":
            loadPage("drafts.jsp");
            break;
          case "trash":
            loadPage("trash.jsp");
            break;
          default:
            break;
        }
      }

      function handleWriteButtonClick() {
        loadPage("mail_write.jsp");
      }

      function loadPage(pageUrl) {
        $.ajax({
          url: pageUrl,
          dataType: "html",
          success: function(response) {
            $(".right_main").html(response);
            if (pageUrl === "mail_write.jsp") {
              initializeSummernote();
            }
          },
          error: function(xhr, status, error) {
            console.error(error);
          }
        });
      }

      function initializeSummernote() {
        setTimeout(function() {
          $('.summernote').summernote({
            height: 450,
            width: 1300,
            codemirror: {
              theme: 'monokai'
            },
            toolbar: [
              // [groupName, [list of button]]
              ['fontname', ['fontname']],
              ['fontsize', ['fontsize']],
              ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
              ['color', ['forecolor', 'color']],
              ['table', ['table']],
              ['para', ['ul', 'ol', 'paragraph']],
              ['height', ['height']],
              ['insert', ['picture', 'link', 'video']],
              ['view', ['fullscreen', 'help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
          });
        }, 500);
      }

      // 페이지 로드가 완료되었을 때 Summernote 초기화
      initializeSummernote();
    });
  </script>
</head>
<body>
  <div class="top_window">
    <div class="top_menu">
      <div class="mail_gruop" style="flex: 1;">
        <ul id="mail_list">
          <li id="inbox">받은 메일함</li>
          <li id="my_inbox">내게 쓴 메일함</li>
          <li id="sendMailBox">보낸 메일함</li>
          <li id="drafts">임시보관함</li>
          <li id="trash">휴지통</li>
        </ul>
      </div>
      <div class="write_mail">
        <button class="btn btn-primary" id="write" type="button">
          <span class="img_mail">메일쓰기</span>
        </button>
        <button class="btn btn-primary" id="me_write" type="button">
          <span class="img_mail">내게쓰기</span>
        </button>
        <span class="bg_bar"></span>
      </div>
    </div>
    <div class="right_main">
      <%-- <%@ include file="../mail/mail_all_inbox.jsp" %> --%>
    </div>
  </div>
</body>
</html>
