<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="ProTutor.studentReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 374px;
        }

        .t1{
            margin-left:250px;
            width:400px;
        }

        .sign-in{
            margin-left:150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

    <div class="t1">

        <p>Please enter your user information</p>

        

        <div class="auto-style1">



            <asp:TextBox ID="tbxFName" type="text" placeholder="First Name" runat="server"/> <br />
            <asp:TextBox ID="tbxLName" type="text" placeholder="Last Name"  runat="server"/><br />
            <asp:TextBox ID="tbxEMail" type="text" placeholder="Your Email" runat="server"/><br />
            <asp:TextBox ID="tbxMobNo" type="text" placeholder="Your Mobile Number" runat="server"/><br />

            <p>birthday:</p>

            <asp:TextBox ID="tbxDOB" type="text"  runat="server"/><br />
            


            <asp:TextBox ID="tbxPass" type="password" placeholder="Password" runat="server"/><br />
            <asp:TextBox ID="tbxPass2" type="password" placeholder="Repeat your password" runat="server"/><br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to all statements in Terms of service" /><br />



            <asp:Button ID="Button1" runat="server" Text="Sign in" class="sign-in" OnClick="Button1_Click1"/>



        </div>





    </div>


    </form>

    
</body>
</html>
