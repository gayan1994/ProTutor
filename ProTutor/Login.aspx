﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProTutor.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 282px;
        }

        .register-link {
            color: black;
            text-decoration: none;
        }

        .forgot-password {
            margin-right:657px;
            float:right;
            color: black;
            text-decoration: none;
        }

        .e-mail {
            width: 500px;
            margin-left: 175px;
            border: 2px solid #aaa;
            border-radius: 4px;
            outline: none;
            padding: 8px;
            box-sizing: border-box;
            transition: .3s;
        }

            .e-mail:focus {
                border-color: dodgerBlue;
                box-shadow: 0 0 8px 0 dodgerBlue;
            }

        .pass-word {
            width: 500px;
            margin-left: 175px;
            border: 2px solid #aaa;
            border-radius: 4px;
            outline: none;
            padding: 8px;
            box-sizing: border-box;
            transition: .3s;
        }

            .pass-word:focus {
                border-color: dodgerBlue;
                box-shadow: 0 0 8px 0 dodgerBlue;
            }

        .log-in {
            margin-left: 175px;
            color: #fff !important;
            text-transform: uppercase;
            text-decoration: none;
            background: #ed3330;
            padding: 10px;
            border-radius: 5px;
            display: inline-block;
            border: none;
            transition: all 0.4s ease 0s;
        }

            .log-in:hover {
                background: #434343;
                letter-spacing: 1px;
                -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
                transition: all 0.4s ease 0s;
            }

            .log {

                font-size: 20px;
                background-color: #f5f5f5
                
            }

            .align-left {
                margin-left: 175px;
            }

        .auto-style2 {
            font-size: 20px;
            background-color: #f5f5f5;
            width: 736px;
        }
        .auto-style3 {
            width: 736px;
        }

        #HyperLink1{
            font-weight:bold;
        }

        #createAccount{
             margin-left: 175px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            &nbsp;
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Login</td>
            </tr>
            <tr>
                <td class="auto-style3"><span style="color: rgb(0, 0, 0); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: -webkit-center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    If you are already registered please login directly here</span><br class="Apple-interchange-newline" />
                    <br />
                    <br />

                    <asp:TextBox ID="tbxEmail" type="text" placeholder="Email" class="e-mail" runat="server" /><br />
                    <asp:RequiredFieldValidator id="ReqEmail"
                        CssClass="align-left"
                        ControlToValidate="tbxEmail"
                        Display="Dynamic"
                        ErrorMessage="Please enter your Email!"
                        runat="server"/>
                    <br />

                    <asp:TextBox ID="tbxPassword" type="password" placeholder="Password" class="pass-word" runat="server"/><br />
                    <asp:RequiredFieldValidator id="ReqPassword"
                        CssClass="align-left"
                        ControlToValidate="tbxPassword"
                        Display="Dynamic"
                        ErrorMessage="Please enter your password!"
                        runat="server"/>

                    <span id="passValidation" runat="server" visible="false" class="align-left">Invalid Email or Password</span>
                    <br />
                    <asp:Button ID="btnSignIn" runat="server" Text="Login" CssClass="log-in" OnClick="Button1_Click" />
                    <br />
                    <br />

                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="/forgotYourPassword.aspx" CssClass="forgot-password">Forgot your password?</asp:HyperLink>
                    
                    <br />
                    <br />
                    <div id="createAccount">
                    <span>Not Registered?</span>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/Registration.aspx" CssClass="register-link">Create an Account</asp:HyperLink>
                    </div>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>