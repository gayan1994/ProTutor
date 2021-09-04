<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStudentProfile.aspx.cs" Inherits="ProTutor.EditStudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="col-md-4"></div>
        <div class="col-md-4">

            <h1 style="text-align: center;">Edit Your Profile</h1>
            <br />


            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxFName" type="text" placeholder="First name" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqFName"
                    ControlToValidate="tbxFName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your first name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxLName" type="text" placeholder="Last name" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqLName"
                    ControlToValidate="tbxLName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your last name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxEMail" type="text" placeholder="Your Email" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqEmail"
                    ControlToValidate="tbxEMail"
                    Display="Dynamic"
                    ErrorMessage="Please enter your email!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator runat="server"
                    ID="RegularExpressionValidator2"
                    ControlToValidate="tbxEmail"
                    Display="Dynamic"
                    ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                    ErrorMessage="Invalid email address!"
                    CssClass="text-danger" />

                <span id="emailValidation" runat="server" visible="false" class="align-left text-danger">This email address is already in use!</span>
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxMobNo" type="text" placeholder="Your mobile number" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqMobNo"
                    ControlToValidate="tbxMobNo"
                    Display="Dynamic"
                    ErrorMessage="Please enter your mobile number!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ControlToValidate="tbxMobNo"
                    runat="server"
                    Display="Dynamic"
                    ValidationExpression="[0-9]{10}"
                    ErrorMessage="Please enter the valid and full mobile number!"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <label class="labelweight">Birthday:</label>
                <input type="date" id="DOBPicker" runat="server" class="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqBday"
                    CssClass="align-left text-danger"
                    ControlToValidate="DOBPicker"
                    Display="Dynamic"
                    ErrorMessage="Please insert your birth day!"
                    runat="server" />

                <span id="dobValidation" runat="server" visible="false" class="text-danger">Please choose a valid date of birth!</span>
            </div>

          
            <br />

            <div class="form-group">
                <h4 style="text-align: center;">Credit/Debit card details</h4>

                <asp:TextBox class="formInput" ID="tbxCardNumber" type="text" runat="server" placeholder="Credit/Debit card number" CssClass="form-control" />
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    ControlToValidate="tbxCardNumber"
                    Display="Dynamic"
                    ErrorMessage="Please enter your credit/debit card number!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegCardNumber"
                    ControlToValidate="tbxCardNumber"
                    Display="Dynamic" runat="server"
                    ErrorMessage="Only Numbers are allowed!"
                    ValidationExpression="\d+"
                    CssClass="text-danger">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxCVN" type="text" runat="server" placeholder="CVN" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="cvnValidator"
                    ControlToValidate="tbxCVN"
                    Display="Dynamic"
                    ErrorMessage="Please enter the CVN!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegCVN"
                    ControlToValidate="tbxCVN"
                    Display="Dynamic" runat="server"
                    ErrorMessage="Only Numbers are allowed!"
                    ValidationExpression="\d+"
                    CssClass="text-danger">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxExpiryMonth" type="text" runat="server" placeholder="Expiry month" CssClass="form-control" />
                
                <asp:RequiredFieldValidator ID="expiryMonthValidator"
                    ControlToValidate="tbxExpiryMonth"
                    Display="Dynamic"
                    ErrorMessage="Please enter the expiry month!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegExpiryMonth"
                    ControlToValidate="tbxExpiryMonth"
                    Display="Dynamic" runat="server"
                    ErrorMessage="Only Numbers are allowed!"
                    ValidationExpression="\d+"
                    CssClass="text-danger">
                </asp:RegularExpressionValidator>

                <span id="expiryMonthValidation" runat="server" visible="false" class="text-danger">Expiry month is invalid!</span>
            </div>

            <div class="form-group">
                <asp:TextBox class="formInput" ID="tbxExpiryYear" type="text" runat="server" placeholder="Expiry year" CssClass="form-control" />
                
                <asp:RequiredFieldValidator ID="expiryYearValidator"
                    ControlToValidate="tbxExpiryYear"
                    Display="Dynamic"
                    ErrorMessage="Please enter the expiry year!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegExpiryYear"
                    ControlToValidate="tbxExpiryYear"
                    Display="Dynamic" runat="server"
                    ErrorMessage="Only Numbers are allowed!"
                    ValidationExpression="\d+"
                    CssClass="text-danger">
                </asp:RegularExpressionValidator>

                <span id="expiryYearValidation" runat="server" visible="false" class="text-danger">Expiry year is invalid!</span>
            </div>
            <br />

            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Save" class="sign-in formInput" OnClick="Button1_Click1" CssClass="btn btn-primary btn-block" />

            </div>
        </div>
        <div class="col-md-4"></div>
    </div>

</asp:Content>
