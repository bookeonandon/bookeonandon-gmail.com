<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My 계정</title>
    <style>
        body {
            width: 1200px;
            margin: auto;
            padding: 0px;
        }

        .body-content {
            width: 1100px;
            margin: auto;
            padding: 0px;
        }

        table {
            width: 1100px;
        }

        .content {
            width: 520px;
            height: 250px;
            border: 1px solid purple;
            border-bottom-left-radius: 20px;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top-right-radius: 20px;
            margin: 0px;
            padding: 0px;
        }

        fieldset>legend {
            margin-left: 30px;
            font-size: 16px;
            padding-left: 5px;
            padding-right: 5px;
        }

        fieldset>div {
            margin-top: 5px;
            margin-bottom: 5px;
            margin-left: 10px;
            margin-right: 10px;
        }
    </style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
    <br>
    <div class="body-content">
        <table>
            <tr>
                <td>
                    <fieldset class="content">
                        <legend>My 소모임</legend>
                        <div>content1</div>
                    </fieldset>
                </td>
                <td style="width: 40px;"></td>
                <td>
                    <fieldset class="content">
                        <legend>My 쿠폰</legend>
                        <div>content1</div>
                    </fieldset>
                </td>
            </tr>
            <tr><td colspan="3" style="height: 30px;"></td></tr>
            <tr>
                <td>
                    <fieldset class="content">
                        <legend>My 리뷰</legend>
                        <div>content1</div>
                    </fieldset>
                </td>
                <td></td>
                <td>
                    <fieldset class="content">
                        <legend>My 문의</legend>
                        <div>content1</div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>