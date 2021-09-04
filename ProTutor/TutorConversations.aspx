<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorConversations.aspx.cs" Inherits="ProTutor.TutorConversations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .alert {
            border-color: black;
            border-radius: 20px;
        }

        .alert a:hover {
            color: #0c0505;
        }
    </style>
    <h1 class="py-3 text-center">Conversations</h1>
    <br />
    <div class="container text-center">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <asp:Repeater ID="rptConversations" runat="server">
                <ItemTemplate>
                    <div class="alert ">
                        <asp:HyperLink ID="HyperLink1"
                            runat="server"
                            Text='<%# Eval("Name") %>'
                            NavigateUrl='<%#String.Format("~/TutorMessages.aspx?StudentId={0}", Eval("ID"))%>'>
                        </asp:HyperLink>
                        <br />
                        <asp:Label runat="server" Text='<%# Eval("LastMessageDate", "{0:dd MMMM yyyy hh:mm tt}") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>
