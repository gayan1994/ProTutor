<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewLessonRequest.aspx.cs" Inherits="ProTutor.ViewLessonRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <table>
        <tr>
            <td>Student Name </td>
            <td> <asp:Label ID="lblName" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Start Time</td>
            <td> <asp:Label ID="lblStart" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>End Time </td>
            <td> <asp:Label ID="lblEnd" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Status</td>
            <td> <asp:Label ID="lblStatus" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Hourly Rate</td>
            <td> <asp:Label ID="lblHourlyRate" runat="server"> </asp:Label></td>
        </tr>

    </table> 

        <asp:Button ID="btnAccept" Visible="false" runat="server" Text="Accept" OnClick="btnAccept_Click" />
        <asp:Button ID="btnStart" Visible="false" runat="server" Text="Start" OnClick="btnStart_Click" />
        <asp:Button ID="btnFinish" Visible="false" runat="server" Text="Finish" OnClick="btnFinish_Click" />

    </form>
</body>
</html>
