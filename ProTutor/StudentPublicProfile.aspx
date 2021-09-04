<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentPublicProfile.aspx.cs" Inherits="ProTutor.StudentPublicProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="contianer">
        <h1 class="text-center">Student Profile</h1>
        <br />
        <div class="container">
            <br />
            <br />
            <table border="1" class="table">
                <tr>
                    <td>Name </td>
                    <td>
                        <asp:Label ID="lblName" runat="server"> </asp:Label></td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server"> </asp:Label></td>
                </tr>

                <tr>
                    <td>Mobile Number </td>
                    <td>
                        <asp:Label ID="lblMobileNumber" runat="server"> </asp:Label></td>
                </tr>

                <tr>
                    <td>Age</td>
                    <td>
                        <asp:Label ID="lblAge" runat="server"> </asp:Label></td>
                </tr>

            </table>

            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" CssClass="btn btn-warning btn-block" />
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                </div>
            </div>

        </div>
    </div>

</asp:Content>
