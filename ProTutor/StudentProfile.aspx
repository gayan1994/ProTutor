<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="ProTutor.StudentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
    <table>
        <tr>
            <td>Name </td>
            <td> <asp:Label ID="lblName" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Email</td>
            <td> <asp:Label ID="lblEmail" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Mobile Number </td>
            <td> <asp:Label ID="lblMobileNumber" runat="server"> </asp:Label></td>
        </tr>

        <tr>
            <td>Date of Birth</td>
            <td> <asp:Label ID="lblDOB" runat="server"> </asp:Label></td>
        </tr>

    </table> <br />

</body>
</html>
