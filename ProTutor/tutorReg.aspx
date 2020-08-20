<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tutorReg.aspx.cs" Inherits="ProTutor.tutorReg" %>

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
            width: 450px;
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
            width: 400px;
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



                <asp:TextBox ID="tbxfName" type="text" placeholder="First Name" runat="server" /><br />
                <asp:TextBox ID="tbxlName" type="text" placeholder="Last Name" runat="server"/><br />
                <asp:TextBox ID="tbxEmail" type="text" placeholder="Your Email" runat="server"/><br />
                <asp:TextBox ID="tbxMobNum" type="text" placeholder="Your Mobile Number" runat="server"/><br />

                <p>birthday:</p>

                <asp:TextBox ID="Text5" type="text" runat="server"/><br />


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
                        <%--<li>
                            <input type="radio" id="f-option" name="selector" />
                            <label for="f-option">Experience</label>

                            <div class="check"></div>
                        </li>

                        <li>
                            <input type="radio" id="s-option" name="selector" />
                            <label for="s-option">Degree</label>

                            <div class="check">
                                <div class="inside"></div>
                            </div>
                        </li>

                        <li>
                            <input type="radio" id="t-option" name="selector" />
                            <label for="t-option">MSC</label>

                            <div class="check">
                                <div class="inside"></div>
                            </div>
                        </li>

                        <li>
                            <input type="radio" id="t-option" name="selector" />
                            <label for="t-option">Phd</label>

                            <div class="check">
                                <div class="inside"></div>
                            </div>
                        </li>--%>

                    
                </div>
                <input id="Text1" type="text" placeholder="What is the name of the school?"/><br />
                <input id="Text6" type="text" placeholder="What is the main subject you teach?"/><br />
                <input id="Text6" type="text" placeholder="Which curriculum do you teach?"/><br />
                <input id="Text6" type="text" placeholder="In what year did you start teaching?"/><br />
                <input id="Text6" type="text" placeholder="Submit your Certificate"/><br />
                <input id="Text6" type="text" placeholder="What is the date which you can start upon our acceptance?"/><br />
                <input id="Text6" type="text" placeholder="Do you have any other information to share with us to support your application?"/><br />

                <asp:TextBox ID="Pass2" type="password" placeholder="Password" runat="server"/><br />
                <asp:TextBox ID="rPass" type="password" placeholder="Repeat password" runat="server"/><br />







                <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to all statements in Terms of service" /><br />



                <asp:Button ID="Button1" runat="server" Text="Sign in" class="sign-in" OnClick="Button1_Click" />



            </div>





        </div>


    </form>


</body>
</html>
