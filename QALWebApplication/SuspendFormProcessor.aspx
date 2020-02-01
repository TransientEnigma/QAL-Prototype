<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<!-------------------------- Web Page Content --------------------------------->

<head runat="server">
    <% string MainMenu = Request.Form["btnMenuButton"];
        if(MainMenu == "MainMenu")
        {
            Response.Redirect("StaffLogedin.html");
        }


      %>
    <meta charset="utf-8" />
    <title>QAL Suspend Borrower</title>
    <link href="QAL-Style.css" rel="stylesheet" />
</head>
<body>

         

                             <%
                                 /*create an instance of the database connection class to use as for connecting to DB*/
                                 clsDataConnection MyConnection = new clsDataConnection();
                                 /*variable to store the number of records */
                                 Int32 RecordCount = 0;
                                 /*variable to store the number of columns*/
                                 Int32 ColumnCount = 0;

                                 /*variable to use as to index rows*/
                                 Int32 RecordIndex = 0;

                                 //string FirstName = Request.Form["txtFirstName"];
                                 //string LastName = Request.Form["txtLastName"];
                                 //string Name = FirstName + " " + LastName;
                                 //string AddressLineOne = Request.Form["txtAddressLineOne"];
                                 //string AddressLineTwo = Request.Form["txtAddressLineTwo"];
                                 //string PostCode = Request.Form["txtPostCode"];
                                 //string PhoneNumber = Request.Form["txtPhoneNumber"];
                                 //string StudentOrNot = Request.Form["cbxStudent"];

                                 string SearchParameter = Request.Form["txtSearchParameter"];
                                 string BorrowerId = Request.Form["lstBorrowerDetails"];
                                 string SearchOrSuspend = Request.Form["SearchOrSuspend"];
                                 string Reason = Request.Form["lstReason"];
                                 string SuspendOrUnsuspend = Request.Form["SearchOrSuspend"];




                                 //if (Page.IsPostBack)
                                 //{
                                 //    Response.Redirect("ConfirmSuspensionProcessor.aspx?param1MemberId=" + MemberId + "&param2Reason=" + Reason + "&param3Suspend="+ Suspend + "");
                                 //}




                                 if(SearchOrSuspend == "Search")
                                 {
        %><div class="topmargin"><h3>Search and Suspend </h3></div>
        <br /><div class="leftmargin"></div>

        <div class="centredcontent">
            <form method="post" action="SuspendFormProcessor.aspx">
                <div class="leftside">
                    <!-- Content for left side-->
                    <h1>Search Borrower</h1>
                    <table border="0">
                        <tr><td>You can search by name , address, or Borrower ID.</td><td></td></tr>
                        <tr><td>Enter search criteria in the search field and click search:</td><td></td></tr>
                        <tr><td>Search Field: <input type="text" class="searchbox" name="txtSearchParameter" /></td></tr>
                    </table>
                    <br /> <%
            
            /*Execute the stored procedure to select the information from the database based on the search criteria*/
            MyConnection.AddParameter("@SearchParameter", SearchParameter);
            MyConnection.Execute("sproc_SearchBorrower");

            /*Get the count for the number of columns from the data table*/

            ColumnCount = MyConnection.DataTable.Columns.Count;

            /*traverse the columns and get the column name for each column in turn and display is as a row*/


            /*RecordIndex = 0;*/



            %>
                <!-- integration of html from the original Suspend.html -->
                 
                <select class="bigbox" name="lstBorrowerDetails" multiple="multiple">
              
                <%
                    /*Get the record count (i.e. number of rows of data)*/
                    RecordCount = MyConnection.Count;
                   
                    /*while traversing each record (row), traverse the columns using column index. */
                    while (RecordIndex < RecordCount)
                    {
                %>
                <!-- html for the list box, add the item with value provided by loop -->
                    <!-- primary key value for the list item -->
                    <option value=" <% Response.Write(MyConnection.DataTable.Rows[RecordIndex][0]); %> ">
                   <!-- the Borrower details to the list -->
                    <% Response.Write(
                           "ID: " + MyConnection.DataTable.Rows[RecordIndex][0] + ", "
                           //fname
                           + MyConnection.DataTable.Rows[RecordIndex][2] + ", "
                           //lnames
                           + MyConnection.DataTable.Rows[RecordIndex][3] + ", "
                           //post code
                           + MyConnection.DataTable.Rows[RecordIndex][4] + ", "
                            //fname
                           + MyConnection.DataTable.Rows[RecordIndex][5] + ", "
                           //lnames
                           + MyConnection.DataTable.Rows[RecordIndex][6] + ", "
                           //post code

                           //lnames
                           + "["+ MyConnection.DataTable.Rows[RecordIndex][9] + "] "
                           //post code
                           +" ["+ MyConnection.DataTable.Rows[RecordIndex][10] + "] "

                        );
                    %>         
                    </option>
                    <% 
                            RecordIndex++;
                        }
                    %>

                            </select>
                                <br />
                                <br />
                                <div class="QAL-Bar">
                                    <button class="LongButton">Back</button>

                                    <input type="submit" class="LongButton" name="SearchOrSuspend" value="Search" />


                                    <button class="LongButton">Main Menu</button>
                                </div>
                                <!-- Content for right side -->
                            </div>
                
                          <div class="rightside">
                               <h1>Suspend Borrower</h1>
                                <br />
                                <br />
                                <br />
                                <br />
                    
                                <table border="0">

                                    <tr><td>Select a reason for suspension:</td></tr>
                                    <tr>
                                        <td>
                                              <select name="lstReason">
                                                  <option value="None Selected">None Selected</option>
                                                  <option value="Misconduct">Misconduct</option>
                                                  <option value="Abussive">Abussive</option>
                                                  <option value="Theft">Theft</option>
                                                  <option value="Fake ID">Fake ID</option>
                                                  <option value="Unpaid Fines">Unpaid Fines</option>
                                                  <option value="Physical Damage">Physical Damage</option>
                                              </select>
                                        </td>
                                    </tr>
                                    <tr><td>Or add reason for suspension:</td></tr>
                                    <tr><td><textarea rows="1" cols="50" name="AreaBorrowerDetails"></textarea></td></tr>
                                </table>
                                <div class="leftside">
                                    <br />
                                    <input class="LongButton" type="submit" name="SearchOrSuspend" value="Suspend" />
                                   <br />
                                    <br />
                              <input class="LongButton" type="submit" name="SearchOrSuspend" value="Unsuspend" />
                                </div>
                                <div class="logo"><img src="images/QAL4logo.png"/></div>
                          </div>
                        </form>
                    </div>

                    <div class="rightmargin"></div>
                    <br /><div class="bottommargin"></div>
    

                    <%
                    
                }
                if ((SearchOrSuspend == "Suspend") ||(SearchOrSuspend == "Unsuspend"))
                {
                 Response.Redirect("ConfirmSuspensionProcessor.aspx?param1BorrowerId=" + BorrowerId + "&param2Reason=" + Reason + "&param3SuspendOrUnsuspend="+ SuspendOrUnsuspend + "");
                            %><div class="topmargin"><h3>Search and Suspend </h3></div>
        <br /><div class="leftmargin"></div>

        <div class="centredcontent">
            <form method="post" action="SuspendFormProcessor.aspx">
                <div class="leftside">
                    <!-- Content for left side-->
                    <h1>Search Borrower</h1>
                    <table border="0">
                        <tr><td>You can search by name , address, or Borrower ID.</td><td></td></tr>
                        <tr><td>Enter search criteria in the search field and click search:</td><td></td></tr>
                        <tr><td>Search Field: <input type="text" class="searchbox" name="txtSearchParameter" /></td></tr>
                    </table>
                    <br /> <%  /*create an instance of the database connection class to used for connecting to DB*/
//try
//{
//    clsDataConnection dbConnection = new clsDataConnection();

//    /*Execute the stored procedure to select the information from the database based on the search criteria*/
//    dbConnection.AddParameter("@bor_id", MemberId);
//    dbConnection.AddParameter("@bor_status", Suspend);
//    dbConnection.AddParameter("@bor_reason", Reason);
//    dbConnection.Execute("sproc_UpdateBorrowerStatus");
//}
//catch
//{
//    //do nothing if above code fails
//}




            %>
                <!-- integration of html from the original Suspend.html -->
                 
                <select class="bigbox" name="txtBorrowerDetails" multiple="multiple">
              
  

                            </select>
                                <br />
                                <br />
                                <div class="QAL-Bar">
                                    <button class="LongButton">Back</button>

                                    <input type="submit" class="LongButton" name="SearchOrSuspend" value="Search" />


                                    <button class="LongButton">Main Menu</button>
                                </div>
                                <!-- Content for right side -->
                            </div>
                
                          <div class="rightside">
                               <h1>Suspend Borrower</h1>
                                <br />
                                <br />
                                <br />
                                <br />
                    
                                <table border="0">

                                    <tr><td>Select a reason for suspension:</td></tr>
                                    <tr>
                                        <td>
                                            <select name="lstReason">
                                                  <option value="None Selected">None Selected</option>
                                                  <option value="Misconduct">Misconduct</option>
                                                  <option value="Abussive">Abussive</option>
                                                  <option value="Theft">Theft</option>
                                                  <option value="Fake ID">Fake ID</option>
                                                  <option value="Unpaid Fines">Unpaid Fines</option>
                                                  <option value="Physical Damage">Physical Damage</option>
                                              </select>
                                        </td>
                                    </tr>
                                    <tr><td>Or add reason for suspension:</td></tr>
                                    <tr><td><textarea class="borrowerdetails" rows="1" cols="50" name="AreaBorrowerDetails"></textarea></td></tr>
                                </table>
                                <div class="leftside">
                                    <br />
                                    <input class="LongButton" type="submit" name="SearchOrSuspend" value="Suspend" />
                                    <br />
                                    <br />
                              <input class="LongButton" type="submit" name="SearchOrSuspend" value="Unsuspend" />
                                </div>
                                <div class="logo"><img src="images/QAL4logo.png"/></div>
                          </div>
                        </form>
                    </div>

                    <div class="rightmargin"></div>
                    <br /><div class="bottommargin"></div>
    

                    <%
                        }
                        %>
</body>
</html>

