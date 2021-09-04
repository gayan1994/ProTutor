<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ProTutor.ContactUs" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="call-to-action text-white text-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto homeslider">
                    <h1 class="text-white"><%: Title %></h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container text-center testimonials">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="form-group">
                <asp:TextBox ID="tbxYourName" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="ReqName"
                    CssClass="align-left text-danger"
                    ControlToValidate="tbxYourName"
                    Display="Dynamic"
                    ErrorMessage="Please enter your name!"
                    runat="server" />
            </div>

            <div class="form-group">
                <asp:TextBox ID="tbxYourEmail" runat="server" placeholder="Your Email" class="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="ReqEmail"
                    CssClass="align-left text-danger"
                    ControlToValidate="tbxYourEmail"
                    Display="Dynamic"
                    ErrorMessage="Please enter your email address!"
                    runat="server" />
            </div>

            <div class="form-group">
                <asp:TextBox ID="tbxMessage" runat="server" placeholder="Message" class="form-control" TextMode="MultiLine" Style="height: 150px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="ReqMessage"
                    CssClass="align-left text-danger"
                    ControlToValidate="tbxMessage"
                    Display="Dynamic"
                    ErrorMessage="Please enter your message!"
                    runat="server" />
            </div>

            <div class="form-group">
                <asp:Button runat="server" Text="Send" class="btn btn-primary btn-block" />
            </div>
            <br />

            <div class="Telephone">
                <h3>Telephone</h3>
                <p>0332233447</p>
            </div>
            <br />

            <div class="Enquiries">
                <h3>General Enquiries</h3>
                <p>weekdays 9:00am- 5:00pm</p>
            </div>
            <br />

            <div class="PostalAddress">
                <h3>Our Postal Address</h3>
                <p>20/05/01/E, Ambagahalanda Watta Rd, Yakkala</p>
            </div>
            <br />

            <div class="Email">
                <h3>Email</h3>
                <p>support@protutor.com</p>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
