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
     //create an instance of the database connection class to used for connecting to DB
     clsDataConnection dbConnection = new clsDataConnection();
     //get the borrower details posted
     string BorrowerId = Request.QueryString["param1BorrowerId"];
     string Reason = Request.QueryString["param2Reason"];
     string SuspendOrUnsuspend = Request.QueryString["param3SuspendOrUnsuspend"];
     //execute the stored procedure to suspend of unsuspend a memner based on MemberId
     try
     {
         //these set the BorrowerId so the format fits with how it is in the tables.
         BorrowerId = BorrowerId.Trim(); //removes all spaces on either side of the string
         BorrowerId = BorrowerId.PadRight(9, ' '); //adds spaces to the right so that it is 9 characters long.
         //Execute the stored procedure to select the information from the database based on the search criteria
         dbConnection.AddParameter("@bor_id", BorrowerId);
         dbConnection.AddParameter("@bor_status", SuspendOrUnsuspend);
         dbConnection.AddParameter("@bor_reason", Reason);
         dbConnection.Execute("sproc_UpdateBorrowerStatus");
     }
     catch
     {
         //do nothing if above code fails
     }
%>
    
    <div>
        <div class="topmargin"><h3>Main Menu</h3></div>
        <br /><div class="leftmargin"></div>

        <div class="centredcontent">
            <br />
            <br /><div class="mainmenu">
                <div class="logo"><img src="images/QAL4logo.png" /></div>
                <h1>Update Confirmed</h1>
                <a href="Suspend.html">
                    <!--creates a button linking to the reserve book page-->
                    <button class="LongButton">OK</button>
                </a>
            </div>
        </div>
        <div class="rightmargin"></div>
        <br /><div class="bottommargin"></div>
    </div>
</body>
</html>