<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorProfile.aspx.cs" Inherits="ProTutor.TutorProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .tabletd {
            width: 244px;
        }

        .mt-4 {
            margin-top: 28px;
        }
    </style>
    <div class="container">
        <h1 class="text-center">Tutor Profile</h1>
        <div class="row">
            <div class="col-md-5">
            </div>
            <div class="col-md-2">

                <asp:Image ID="imgProPic" runat="server" CssClass="mb-5" Width="200" Height="200" AlternateText="No Image" />
            </div>
            <div class="col-md-5">
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-4 text-center">
                <div class="alert alert-info">
                    <span>Total Lessons Conducted</span> = 
                <b>
                    <asp:Label ID="lblCompletedSessions" Text="" runat="server" /></b>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <div class="alert alert-info">
                    <span>Total Lesson Requests Received</span> = 
               <b>
                   <asp:Label ID="lblTotalRequests" Text="" runat="server" /></b>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <div class="alert alert-info">
                    <span>Pending Lesson Requests</span> = 
               <b>
                   <asp:Label ID="lblNotResponded" Text="" runat="server" /></b>
                </div>

            </div>
        </div>




        <br />
        <a runat="server" href="~/EditTutorProfile.aspx" class="btn btn-warning" style="float: right;">Edit Profile</a>
        <br />
        <br />
        <table border="1" style="width: 100%;" class="table">
            <tr>
                <td class="tabletd">Name</td>
                <td>
                    <asp:Label ID="lblName" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Email</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Age</td>
                <td>
                    <asp:Label ID="lblAge" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Subject</td>
                <td>
                    <asp:Label ID="lblSubject" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Highest Qualification</td>
                <td>
                    <asp:Label ID="lblQualification" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Curriculum</td>
                <td>
                    <asp:Label ID="lblCurriculum" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Hometown</td>
                <td>
                    <asp:Label ID="lblHometown" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Summary</td>
                <td>
                    <asp:Label ID="lblSummary" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Hourly rate (Rs)</td>
                <td>
                    <asp:Label ID="lblHourlyRate" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td class="tabletd">Current Balance</td>
                <td>
                    <asp:Label ID="lblCurrentBalance" runat="server"> </asp:Label></td>
            </tr>
            <tr>
                <td class="tabletd">Rating</td>
                <td>
                    <asp:Label ID="lblRating" runat="server"> </asp:Label></td>
            </tr>

        </table>
        <div class="form-group">
            <asp:Button ID="btnCashOut" runat="server" Text="Cash Out" class="btn btn-primary" OnClick="btnCashOut_Click" OnClientClick="javascript:return confirm('Are you sure you want to cash out?')" />
            <asp:Label ID="lblCashoutInfo" runat="server" Visible="false" class="alert alert-danger"> To request a cashout, your current balance must be at least Rs.5000 </asp:Label>
        </div>
    </div>
</asp:Content>



