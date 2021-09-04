<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tutorReg.aspx.cs" Inherits="ProTutor.tutorReg" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        label {
            padding-left: 10px;
        }
    </style>
    <div class="container">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h1 class="text-center">Tutor Registration</h1>
            <br />

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxfName" type="text" placeholder="First name" runat="server" CssClass="form-control" />
                
                <asp:RequiredFieldValidator ID="ReqFName"
                    ControlToValidate="tbxfName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your first name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxlName" type="text" placeholder="Last name" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqLName"
                    ControlToValidate="tbxlName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your last name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxEmail" type="text" placeholder="Your Email" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqEmail"
                    ControlToValidate="tbxEmail"
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
                <asp:TextBox class="inputForm" ID="tbxMobNum" type="text" placeholder="Your mobile number" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqMobNo"
                    ControlToValidate="tbxMobNum"
                    Display="Dynamic"
                    ErrorMessage="Please enter your mobile number!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator runat="server"
                    ID="RegularExpressionValidator1"
                    ControlToValidate="tbxMobNum"
                    Display="Dynamic"
                    ValidationExpression="[0-9]{10}"
                    ErrorMessage="Please enter the valid and full mobile number!"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <label>Birthday:</label>

                <input type="date" id="DOBPicker" runat="server" class="form-control" />

                <asp:RequiredFieldValidator ID="ReqBday"
                    ControlToValidate="DOBPicker"
                    Display="Dynamic"
                    ErrorMessage="Please insert your birth day!"
                    runat="server"
                    CssClass="text-danger" />

                <span id="dobValidation" runat="server" visible="false" class="text-danger">Please choose a valid date of birth!</span>
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm longtbx1" ID="tbxHometown" type="text" placeholder="What is your hometown?" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="ReqHometown"
                    ControlToValidate="tbxHometown"
                    Display="Dynamic"
                    ErrorMessage="Please enter your hometown!"
                    runat="server"
                    CssClass="text-danger" />
            </div>


            <h5>What is your highest qualification?</h5>
            <div class="checkbox">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem>Experience</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>Degree</asp:ListItem>
                    <asp:ListItem>MSC</asp:ListItem>
                    <asp:ListItem>Phd</asp:ListItem>
                </asp:RadioButtonList>
                
                <asp:RequiredFieldValidator ID="ReqQualification"
                    ControlToValidate="RadioButtonList1"
                    Display="Dynamic"
                    ErrorMessage="Please choose a qualification!"
                    runat="server"
                    CssClass="text-danger" />

            </div>


            <div class="form-group">
                <asp:TextBox class="inputForm longtbx1" ID="tbxSubject" type="text" placeholder="What is the main subject you teach?" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator ID="ReqtbxSubject"
                    ControlToValidate="tbxSubject"
                    Display="Dynamic"
                    ErrorMessage="Please enter the main subject you teach!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm longtbx1" ID="tbxCurruculum" type="text" placeholder="Which curriculum do you teach?" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator ID="ReqCurriculum"
                    ControlToValidate="tbxCurruculum"
                    Display="Dynamic"
                    ErrorMessage="Please enter the curriculum you teach!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <label>Profile Picture</label>
                <asp:FileUpload class="inputForm" ID="updProfilePicture" runat="server" accept=".png" />
            </div>

            <div class="form-group">
                <label>A brief summary about yourself</label>
                <asp:TextBox class="inputForm longtbx2" ID="tbxSummary" type="text" placeholder="" runat="server" CssClass="form-control" TextMode="MultiLine" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxHourlyRate" type="text" placeholder="Hourly rate? (Rs)" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator ID="ReqHourlyRate"
                    ControlToValidate="tbxHourlyRate"
                    Display="Dynamic"
                    ErrorMessage="Please enter your hourly rate!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:CompareValidator runat="server" Display="Dynamic" Operator="DataTypeCheck" Type="Double"
                    ControlToValidate="tbxHourlyRate" ErrorMessage="Hourly rate must be a number!"
                    CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:TextBox class="inputForm" ID="Pass2" type="password" placeholder="Password" runat="server" CssClass="form-control" />
              
                <asp:RequiredFieldValidator ID="ReqPass"
                    ControlToValidate="Pass2"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:RegularExpressionValidator runat="server"
                    ID="rexNumber"
                    ControlToValidate="Pass2" Display="Dynamic"
                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"
                    ErrorMessage="Password must be 8-10 characters long with at least one numeric character."
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="rPass" type="password" placeholder="Repeat password" runat="server" CssClass="form-control" />

                <asp:RequiredFieldValidator ID="ReqRPass"
                    ControlToValidate="rPass"
                    Display="Dynamic"
                    ErrorMessage="Please enter your Password again!"
                    runat="server"
                    CssClass="text-danger" />
                <asp:CompareValidator runat="server"
                    ID="cmpNumbers"
                    ControlToValidate="rPass"
                    ControlToCompare="Pass2"
                    Operator="Equal"
                    Type="String"
                    ErrorMessage="Password and repeated password doesn't match"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <h4 class="text-center">Bank details</h4>
                <asp:TextBox class="inputForm" ID="tbxAccountNo" placeholder="Bank account number" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="accountNoValidator"
                    ControlToValidate="tbxAccountNo"
                    Display="Dynamic"
                    ErrorMessage="Please enter the account number!"
                    runat="server"
                    CssClass="text-danger" />

                <asp:RegularExpressionValidator ID="RegAccountNo"
                    ControlToValidate="tbxAccountNo"
                    Display="Dynamic" runat="server"
                    ErrorMessage="Only Numbers are allowed!"
                    ValidationExpression="\d+"
                    CssClass="text-danger">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxBank" placeholder="Name of the bank" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="nameofBankValidator"
                    ControlToValidate="tbxBank"
                    Display="Dynamic"
                    ErrorMessage="Please enter the bank name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxBranchName" placeholder="Branch name" runat="server" CssClass="form-control" />
               
                <asp:RequiredFieldValidator ID="branchNameValidator"
                    ControlToValidate="tbxBranchName"
                    Display="Dynamic"
                    ErrorMessage="Please enter the branch name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:TextBox class="inputForm" ID="tbxAccountHolderName" placeholder="Account holder's name" runat="server" CssClass="form-control" />
             
                <asp:RequiredFieldValidator ID="accountHoldersNameValidator"
                    ControlToValidate="tbxAccountHolderName"
                    Display="Dynamic"
                    ErrorMessage="Please enter the account holder's name!"
                    runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="form-group">
                <asp:CheckBox ID="CheckBoxAgreement" runat="server" Text=" I agree to all statements in Terms of service" />
            </div>

            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Sign up" class="sign-in inputForm" OnClick="Button1_Click" CssClass="btn btn-primary btn-block" />
            </div>

        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
