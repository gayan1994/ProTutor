<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSentLessonRequest.aspx.cs" Inherits="ProTutor.ViewSentLessonRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />
        <table border="1" class="table">
            <tr>
                <td>Tutor Name </td>
                <td>
                    <asp:Label ID="lblName" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Start Time</td>
                <td>
                    <asp:Label ID="lblStart" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>End Time </td>
                <td>
                    <asp:Label ID="lblEnd" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Status</td>
                <td>
                    <asp:Label ID="lblStatus" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Hourly Rate</td>
                <td>
                    <asp:Label ID="lblHourlyRate" runat="server"> </asp:Label></td>
            </tr>

        </table>

        <br />
        <asp:Button ID="btnCancel" Visible="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-dark" Style="float: right;" />
        <a href="SentLessonRequests.aspx">
            <img class="img-fluid rounded-circle mb-3" src="Image/goBackArrow.png" alt="" width="50" height="50" style="float: left;">
        </a>
    </div>
</asp:Content>
