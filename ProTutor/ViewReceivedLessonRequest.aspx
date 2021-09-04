<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewReceivedLessonRequest.aspx.cs" Inherits="ProTutor.ViewReceivedLessonRequest" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />

        <table border="1" class="table">
            <tr>
                <td>Student Name </td>
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

        <div class="row">

            <div class="col-md-4">
                <asp:Button ID="btnAccept" Visible="false" runat="server" Text="Accept" OnClick="btnAccept_Click" class="btn btn-info btn-block" />
                <asp:Button ID="btnStart" Visible="false" runat="server" Text="Start Session" OnClick="btnStart_Click" class="btn btn-info btn-block" />
            </div>

            <div class="col-md-4">
                <asp:Button ID="btnFinish" Visible="false" runat="server" Text="Finish Session" OnClick="btnFinish_Click" class="btn btn-info btn-block" OnClientClick="javascript:alert('The lesson has been successfully completed')" />

                <asp:Button ID="btnDecline" Visible="false" runat="server" Text="Decline" OnClick="btnDecline_Click" class="btn btn-dark btn-block" />

            </div>

        </div>
        <br />
        <a href="ReceivedLessonRequests.aspx">
            <img class="img-fluid rounded-circle mb-3" src="Image/goBackArrow.png" alt="" width="50" height="50" style="float: left;">
        </a>
    </div>
</asp:Content>
