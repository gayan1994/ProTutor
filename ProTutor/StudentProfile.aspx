<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="ProTutor.StudentProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contianer">
        <h1 class="text-center">Student Profile</h1>
        <br />
        <div class="container">
            <a runat="server" href="~/EditStudentProfile.aspx" class="btn btn-warning" style="float: right;">Edit Profile</a>
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

        </div>
    </div>
</asp:Content>
