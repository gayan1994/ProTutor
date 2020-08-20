<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ProTutor.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .student{
            display:inline-block;
            margin-left:100px;
            width:400px;
            

        }

        .tutor{
            display:inline-block;
            margin-left:10px;
            width:400px;
        }

        .sentence{
            border-bottom:2px solid black;
            height:25%;
        }

        .crtstudent{
            
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="student">

                <div class="sentence"> <p>Are you a student?</p></div>


                <p>Click here for free registration</p><br />
                <asp:Button ID="Button1" runat="server" Text="Create as student" class="crtstudent"/>
                <br /><br /><br />




            </div>

            <div class="tutor">

                <div class="sentence"> <p>Are you a tutor?</p> </div>

                <p>Click here for free registration</p><br />
                <asp:Button ID="Button2" runat="server" Text="Create as tutor" class="crttutor"/>
                <br /><br /><br />



            </div>
        </div>
    </form>
</body>
</html>
