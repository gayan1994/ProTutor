<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TutorProfile.aspx.cs" Inherits="ProTutor.TutorProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <asp:Image ID="imgProPic" runat="server"/>

    <table>
        <tr>
            <td>Name </td>
            <td> <asp:Label ID="lblName" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Subject</td>
            <td> <asp:Label ID="lblSubject" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Qualification </td>
            <td> <asp:Label ID="lblQualification" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Curriculum</td>
            <td> <asp:Label ID="lblCurriculum" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>School</td>
            <td> <asp:Label ID="lblSchool" runat="server"> </asp:Label></td>
        </tr>

         <tr>
            <td>Summary</td>
            <td> <asp:Label ID="lblSummary" runat="server"> </asp:Label></td>
        </tr>

         <tr>
            <td>Hourly rate</td>
            <td> <asp:Label ID="lblHourlyRate" runat="server"> </asp:Label></td>
        </tr>

    </table>


</body>
</html>
