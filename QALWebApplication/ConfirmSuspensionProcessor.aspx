<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>QAL Main Menu</title>
    <link href="QAL-Style.css" rel="stylesheet" />
</head>
<body>
<%
    string BorrowerId = Request.QueryString["param1BorrowerId"];
    string Reason = Request.QueryString["param2Reason"];
    string SuspendOrUnsuspend = Request.QueryString["param3SuspendOrUnsuspend"];
    //declare a variable to store the query string
    string QueryString;
    QueryString = Convert.ToString("SuspensionConfirmation.aspx?param1BorrowerId=" + BorrowerId + "&param2Reason=" + Reason + "&param3SuspendOrUnsuspend=" + SuspendOrUnsuspend);
%>
    <!-- display's confirmation buttons -->
    <div>
        <div class="topmargin"><h3>Main Menu</h3></div>
        <br /><div class="leftmargin"></div>

        <div class="centredcontent">
            <br />
            <br /><div class="mainmenu">
                <div class="logo"><img src="images/QAL4logo.png" /></div>
                <h1>Are you sure you want to update the satus?</h1>
                       
                            <a href="<%Response.Write(QueryString); %>" >
                    <!--creates a button linking to the suspend borrower page-->
                    <button class="LongButton">Yes</button>
                </a>
                        </form>
                <a href="Suspend.html">
                    <!--creates a button linking to the suspend borrower page-->
                    <button class="LongButton">No</button>
                </a>
            </div>
        </div>
        <div class="rightmargin"></div>
        <br /><div class="bottommargin"></div>
    </div>
</body>
</html>
