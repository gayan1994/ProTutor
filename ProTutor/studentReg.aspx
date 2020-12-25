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
            width:420px;
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



            <asp:TextBox ID="tbxFName" type="text" placeholder="First Name" runat="server"/> 
            <asp:RequiredFieldValidator id="ReqFName"
                    ControlToValidate="tbxFName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your First Name!"
                    runat="server"/> <br />


            <asp:TextBox ID="tbxLName" type="text" placeholder="Last Name"  runat="server"/>
            <asp:RequiredFieldValidator id="ReqLName"
                    ControlToValidate="tbxLName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Last Name!"
                    runat="server"/> <br />


            <asp:TextBox ID="tbxEMail" type="text" placeholder="Your Email" runat="server"/>
            <asp:RequiredFieldValidator id="ReqEmail"
                    ControlToValidate="tbxEMail"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Email!"
                    runat="server"/>

            <asp:RegularExpressionValidator runat="server" 
                id="RegularExpressionValidator2" 
                controltovalidate="tbxEmail" 
                validationexpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                errormessage="Invalid email address" /><br />


            <asp:TextBox ID="tbxMobNo" type="text" placeholder="Your Mobile Number" runat="server"/>
            <asp:RequiredFieldValidator id="ReqMobNo"
                    ControlToValidate="tbxMobNo"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Mobile Number!"
                    runat="server"/> <br />

            <p>birthday:</p>

            <input type="date" id="DOBPicker" runat="server"/>
            <span id="dobValidation" runat="server" visible="false">Please choose a valid date of birth</span>
            <br />
            


            <asp:TextBox ID="tbxPass" type="password" placeholder="Password" runat="server"/>
            <asp:RequiredFieldValidator id="ReqPass"
                    ControlToValidate="tbxPass"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password!"
                    runat="server"/>

            <asp:RegularExpressionValidator runat="server" 
                id="rexNumber" 
                controltovalidate="tbxPass" 
                validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" 
                errormessage="Password must be 8-10 characters long with at least one numeric character." /><br />


            <asp:TextBox ID="tbxPass2" type="password" placeholder="Repeat your password" runat="server"/>
            <asp:RequiredFieldValidator id="ReqRPass"
                    ControlToValidate="tbxPass2"
                    Display="Dynamic"
                    ErrorMessage="Please Repeat your Password!"
                    runat="server"/> 
            <asp:CompareValidator runat="server" 
                    id="cmpNumbers" 
                    controltovalidate="tbxPass2" 
                    controltocompare="tbxPass" 
                    operator="Equal" 
                    type="String" 
                    errormessage="Password and Repeated password doesn't match" /><br />


            <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to all statements in Terms of service" /><br />



            <asp:Button ID="Button1" runat="server" Text="Sign in" class="sign-in" OnClick="Button1_Click1"/>



        </div>





    </div>


    </form>

    
</body>
</html>
