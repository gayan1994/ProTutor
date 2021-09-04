<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ProTutor.Contact" %>

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
        <address>
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
            425.555.0100
        </address>
    </div>
</asp:Content>
