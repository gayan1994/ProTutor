<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProTutor.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">

                <h1>Login</h1>
                <small>If you are already registered please login directly here</small>

                <div class="form-group">

                    <asp:TextBox ID="tbxEmail" type="text" placeholder="Email" class="form-control" runat="server" />
                    
                    <asp:RequiredFieldValidator ID="ReqEmail"
                        CssClass="align-left text-danger"
                        ControlToValidate="tbxEmail"
                        Display="Dynamic"
                        ErrorMessage="Please enter your Email!"
                        runat="server" />
                </div>

                <div class="form-group">
                    <asp:TextBox ID="tbxPassword" type="password" placeholder="Password" class="form-control" runat="server" />
                  
                    <asp:RequiredFieldValidator ID="ReqPassword"
                        CssClass="align-left text-danger"
                        ControlToValidate="tbxPassword"
                        Display="Dynamic"
                        ErrorMessage="Please enter your password!"
                        runat="server" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnSignIn" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Button1_Click" />
                    <br />
                    <br />
                    <span id="passValidation" runat="server" visible="false" class="align-left text-danger">Invalid Email or Password!</span>
                    <br />
                    <br />

                    <div id="createAccount">
                        <span>Not Registered?</span>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/Registration.aspx" CssClass="register-link">Create an Account</asp:HyperLink>
                    </div>
                    <br />

                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</asp:Content>


