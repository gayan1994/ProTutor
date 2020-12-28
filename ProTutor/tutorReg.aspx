<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tutorReg.aspx.cs" Inherits="ProTutor.tutorReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 374px;
        }

        

        .sign-in {
            margin-left: 150px;
        }

        .question1 {
            display: inline-block;
            width: 150px;
        }

        .switch1 {
            display: inline-block;
        }

        

        .radio1 ul {
            list-style: none;
        }

            .radio1 ul li {
                display: inline-block;
                margin-left: 10px;
            }

                .radio1 ul li:hover label {
                    color: red;
                }

        .radio1 input[type=radio]:checked ~ .check {
            border: 2px solid #0DFF92;
        }
        .auto-style2 {
            margin-left: 250px;
            width: 420px;
            height: 674px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <div class="auto-style2">

            <p>Please enter your user information</p>



            <div class="auto-style1">



                <asp:TextBox ID="tbxfName" type="text" placeholder="First Name" runat="server" />
                <asp:RequiredFieldValidator id="ReqFName"
                    ControlToValidate="tbxfName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your First Name!"
                    runat="server"/> <br />


                <asp:TextBox ID="tbxlName" type="text" placeholder="Last Name" runat="server"/>
                <asp:RequiredFieldValidator id="ReqLName"
                    ControlToValidate="tbxlName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Last Name!"
                    runat="server"/> <br />


                <asp:TextBox ID="tbxEmail" type="text" placeholder="Your Email" runat="server"/>
                <asp:RequiredFieldValidator id="ReqEmail"
                    ControlToValidate="tbxEmail"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Email!"
                    runat="server"/> 

                <asp:RegularExpressionValidator runat="server" 
                id="RegularExpressionValidator2" 
                controltovalidate="tbxEmail" 
                validationexpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                errormessage="Invalid email address" /><br />
                


                <asp:TextBox ID="tbxMobNum" type="text" placeholder="Your Mobile Number" runat="server"/>
                <asp:RequiredFieldValidator id="ReqMobNo"
                    ControlToValidate="tbxMobNum"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Mobile Number!"
                    runat="server"/> <br />

                <p>birthday:</p>

                <input type="date" id="DOBPicker" runat="server"/>
                <span id="dobValidation" runat="server" visible="false">Please choose a valid date of birth</span>
                <br />


                <br />
                <br />

                <div class="question1">
                    <p>do you have experience in teaching?</p>
                </div>
                
                <br />
                <br />

                <div class="question2">
                    <p>What is your highest qualification?</p>
                </div>

                <div class="radio1">
                    
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>Experience</asp:ListItem>
                            <asp:ListItem>Degree</asp:ListItem>
                            <asp:ListItem>MSC</asp:ListItem>
                            <asp:ListItem>Phd</asp:ListItem>
                        </asp:RadioButtonList>
                        
                    
                </div>
                <asp:TextBox ID="tbxSchool" type="text" placeholder="What is the name of the school?" runat="server"/><br />
                <asp:TextBox ID="tbxSubject" type="text" placeholder="What is the main subject you teach?" runat="server"/><br />
                <asp:TextBox ID="tbxCurruculum" type="text" placeholder="Which curriculum do you teach?" runat="server"/><br />
                <asp:FileUpload ID= "updProfilePicture" runat = "server" accept=".png" />
                <asp:TextBox ID="tbxSummary" type="text" placeholder="Do you have any other information to share with us to support your application?" runat="server"/><br />
                <asp:TextBox ID="tbxHourlyRate" type="text" placeholder="Hourly rate?" runat="server"/><br />
                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" 
                    ControlToValidate="tbxHourlyRate" ErrorMessage="Value must be a number" />

                <asp:TextBox ID="Pass2" type="password" placeholder="Password" runat="server"/>
                <asp:RequiredFieldValidator id="ReqPass"
                    ControlToValidate="Pass2"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password!"
                    runat="server"/>

            <asp:RegularExpressionValidator runat="server" 
                id="rexNumber" 
                controltovalidate="Pass2" 
                validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" 
                errormessage="Password must be 8-10 characters long with at least one numeric character." /><br />
                
                <asp:TextBox ID="rPass" type="password" placeholder="Repeat password" runat="server"/>
                <asp:RequiredFieldValidator id="ReqRPass"
                    ControlToValidate="rPass"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password again!"
                    runat="server"/>
                <asp:CompareValidator runat="server" 
                    id="cmpNumbers" 
                    controltovalidate="rPass" 
                    controltocompare="Pass2" 
                    operator="Equal" 
                    type="String" 
                    errormessage="Password and Repeated password doesn't match" /><br />







                <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to all statements in Terms of service" /><br />



                <asp:Button ID="Button1" runat="server" Text="Sign up" class="sign-in" OnClick="Button1_Click" />



            </div>





        </div>


    </form>


</body>
</html>
