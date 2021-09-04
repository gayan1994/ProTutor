<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorMessages.aspx.cs" Inherits="ProTutor.TutorMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            overflow-x: hidden;
        }

        .in {
            position: relative;
            text-align: left !important;
            padding: 10px;
            left: 270px;
            width: 250px;
            background-color: #757575;
            color: #fff;
            margin-top: 5px;
            border-radius: 20px;
        }

        .out {
            text-align: right !important;
            padding: 10px;
            position: relative;
            left: 750px;
            background-color: #6d98bd;
            color: #fff;
            width: 250px;
            margin-top: 5px;
            border-radius: 20px;
        }

        .message {
            position: relative;
            left: 257px;
            margin-top: 17px;
        }
    </style>
    <h1 class="py-3 text-center">

        <asp:HyperLink ID="lnkRecipient"
            runat="server"
            Text="#"
            NavigateUrl="#">
        </asp:HyperLink>

    </h1>
    <hr />
    <div class="container">
        <div class="row">

            <asp:Repeater ID="rptMessages" runat="server">

                <HeaderTemplate>
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="<%#((string) Eval("Direction")) == "TutorToStudent" ? "out" : "in"%>">
                        <asp:Label runat="server" Text='<%# Eval("Text") %>' /><br />
                        <asp:Label runat="server" Text='<%# Eval("SentDate", "{0:dd MMMM yyyy hh:mm tt}") %>' Style="color: #d8c3c3;" />
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                </FooterTemplate>

            </asp:Repeater>
        </div>

        <div class="message">
            <br />
            <asp:TextBox ID="tbxMessage" type="text" placeholder="Type your message here..." runat="server" class="form-control" Width="728" />
           
            <div class="form-group">
                <asp:RequiredFieldValidator ID="ReqMessage"
                    ControlToValidate="tbxMessage"
                    Display="Dynamic"
                    ErrorMessage="Please enter your message!"
                    runat="server"
                    CssClass="text-danger" />
            </div>
            <a href="TutorConversations.aspx">
                <img class="img-fluid rounded-circle mb-3" src="Image/goBackArrow.png" alt="" width="50" height="50" style="float: left;">
            </a>
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" class="btn btn-warning" Width="100" Style="float: right; margin-right: 411px;" />
        </div>
    </div>

    <script>

        window.setTimeout(function () {
            window.location.reload();
        }, 20000);

    </script>

</asp:Content>

