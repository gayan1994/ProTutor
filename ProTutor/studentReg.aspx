<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="ProTutor.studentReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 374px;
        }

        .t1 {
            margin-left: 250px;
            width: 420px;
        }

        .sign-in {
            margin-left: 150px;
        }

        .formInput{
            margin-top: 10px;
        }

        .bdaySpan{
            display:block;
            margin-top: 10px;
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



                <asp:TextBox class="formInput"  ID="tbxFName" type="text" placeholder="First Name" runat="server"/>
                <asp:RequiredFieldValidator ID="ReqFName"
                    ControlToValidate="tbxFName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your First Name!"
                    runat="server" />
                <br />


                <asp:TextBox class="formInput" ID="tbxLName" type="text" placeholder="Last Name" runat="server" />
                <asp:RequiredFieldValidator ID="ReqLName"
                    ControlToValidate="tbxLName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Last Name!"
                    runat="server" />
                <br />


                <asp:TextBox class="formInput" ID="tbxEMail" type="text" placeholder="Your Email" runat="server" />
                <asp:RequiredFieldValidator ID="ReqEmail"
                    ControlToValidate="tbxEMail"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Email!"
                    runat="server" />

                <asp:RegularExpressionValidator runat="server"
                    ID="RegularExpressionValidator2"
                    ControlToValidate="tbxEmail"
                    ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                    ErrorMessage="Invalid email address" /><br />


                <asp:TextBox class="formInput" ID="tbxMobNo" type="text" placeholder="Your Mobile Number" runat="server" />
                <asp:RequiredFieldValidator ID="ReqMobNo"
                    ControlToValidate="tbxMobNo"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Mobile Number!"
                    runat="server" />
                <br />

                <span class="bdaySpan">birthday:</span>
                <input type="date" id="DOBPicker" runat="server" />
                <span id="dobValidation" runat="server" visible="false">Please choose a valid date of birth</span>
                
                <br />


                <asp:TextBox class="formInput" ID="tbxPass" type="password" placeholder="Password" runat="server" />
                <asp:RequiredFieldValidator ID="ReqPass"
                    ControlToValidate="tbxPass"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password!"
                    runat="server" />

                <asp:RegularExpressionValidator runat="server"
                    ID="rexNumber"
                    ControlToValidate="tbxPass"
                    Display="Dynamic"
                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"
                    ErrorMessage="Password must be 8-10 characters long with at least one numeric character." />

                <br />


                <asp:TextBox class="formInput" ID="tbxPass2" type="password" placeholder="Repeat your password" runat="server" />
                <asp:RequiredFieldValidator ID="ReqRPass"
                    ControlToValidate="tbxPass2"
                    Display="Dynamic"
                    ErrorMessage="Please Repeat your Password!"
                    runat="server" />
                <asp:CompareValidator runat="server"
                    ID="cmpNumbers"
                    ControlToValidate="tbxPass2"
                    ControlToCompare="tbxPass"
                    Display="Dynamic"
                    Operator="Equal"
                    Type="String"
                    ErrorMessage="Password and Repeated password doesn't match" />

                <br />

                <asp:TextBox class="formInput" ID="tbxCardNumber" type="text" runat="server" placeholder="Card Number" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    ControlToValidate="tbxCardNumber"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Card Number!"
                    runat="server" />
                
                <br />
                
                <asp:TextBox class="formInput" ID="tbxCVN" type="text" runat="server" placeholder="CVN"/>
                <asp:RequiredFieldValidator ID="cvnValidator"
                    ControlToValidate="tbxCVN"
                    Display="Dynamic"
                    ErrorMessage="Please enter the CVN!"
                    runat="server" />
                
                <br />

                
                <asp:TextBox class="formInput" ID="tbxExpiryMonth" type="text" runat="server" placeholder="Expiry Month"/>
                <asp:RequiredFieldValidator ID="expiryMonthValidator"
                    ControlToValidate="tbxExpiryMonth"
                    Display="Dynamic"
                    ErrorMessage="Please enter the Expiry Month!"
                    runat="server" />

                <br />
                
                
                <asp:TextBox class="formInput" ID="tbxExpiryYear" type="text" runat="server" placeholder="Expiry Year" />
                <asp:RequiredFieldValidator ID="expiryYearValidator"
                    ControlToValidate="tbxExpiryYear"
                    Display="Dynamic"
                    ErrorMessage="Please enter the Expiry Year!"
                    runat="server" />

                <br /> <br />


                <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to all statements in Terms of service" /><br />



                <asp:Button ID="Button1" runat="server" Text="Sign in" class="sign-in formInput" OnClick="Button1_Click1" />



            </div>





        </div>


    </form>


</body>
</html>
