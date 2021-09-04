<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorPublicProfile.aspx.cs" Inherits="ProTutor.TutorPublicProfile" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .date {
            left: 210px;
            position: relative;
        }

        body {
            overflow-x: hidden;
        }

        .alert-info {
            color: #000;
            background-color: #fff;
            border-color: #bce8f1;
        }
    </style>
    <h1 class="text-center">Tutor's Profile</h1>
    <div class="container">
        <div class="row">

            <div class="col-md-5">
            </div>

            <div class="col-md-2">
                <asp:Image ID="imgProPic" runat="server" CssClass="mb-5" Width="200" Height="200" AlternateText="No Image" />
            </div>

            <div class="col-md-5">
            </div>

        </div>
        <br />

        <table border="1" style="width: 100%;" class="table">
            <tr>
                <td>Name </td>
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
                <td>Subject</td>
                <td>
                    <asp:Label ID="lblSubject" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Highest qualification </td>
                <td>
                    <asp:Label ID="lblQualification" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Curriculum</td>
                <td>
                    <asp:Label ID="lblCurriculum" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Hometown</td>
                <td>
                    <asp:Label ID="lblHometown" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Summary</td>
                <td>
                    <asp:Label ID="lblSummary" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Hourly rate (Rs)</td>
                <td>
                    <asp:Label ID="lblHourlyRate" runat="server"> </asp:Label></td>
            </tr>

            <tr>
                <td>Rating</td>
                <td>
                    <asp:Label ID="lblRating" runat="server"> </asp:Label></td>
            </tr>

        </table>
        <br />

        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnRequestLesson" runat="server" Text="Send Lesson Request" OnClick="btnRequestLesson_Click" CssClass="btn btn-warning btn-block" />

            </div>
            <div class="col-md-4">
                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" CssClass="btn btn-warning btn-block" />

            </div>
            <div class="col-md-4">
                <asp:Button ID="btnWriteReview" runat="server" Text="Write a review" OnClick="btnWriteReview_Click" CssClass="btn btn-warning btn-block" UseSubmitBehavior="false" />

            </div>
        </div>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <br />
                <asp:TextBox ID="tbxReview" type="text" placeholder="Write Review" class="form-control" runat="server" Visible="false" Style="margin-top: 20px; height: 150px;" TextMode="MultiLine" />
                <span id="spnReview" runat="server" visible="false" class="text-danger">Please write the review!</span>
                <br />
                <asp:TextBox ID="tbxRating" type="text" placeholder="Rating (On a scale of 1-5)" class="form-control" runat="server" Visible="false" />
                <span id="spnRating" runat="server" visible="false" class="text-danger">Please enter the rating</span><br />
                <asp:RangeValidator ID="Rangevalidator1" ErrorMessage="Please enter a value between 1-5." ForeColor="Red" ControlToValidate="tbxRating" MinimumValue="1" MaximumValue="5" runat="server" Type="Double">
                </asp:RangeValidator>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" Visible="false" />

            </div>
            <div class="col-md-3"></div>
        </div>

        <h1 class="py-3 text-center">Reviews by students</h1>
        <asp:Repeater ID="rptRequests" runat="server">

            <ItemTemplate>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="alert alert-info">
                            <div>
                                <b>
                                    <asp:Label ID="lblStudentName" runat="server" Text='<%# Eval("StudentName") %>' /></b>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date","{0:dd MMMM yyyy hh:mm tt}") %>' class="date" />
                            </div>
                            <br />
                            Review :
                            <asp:Label ID="lblReview" runat="server" Text='<%# Eval("Comment") %>' /><br />
                            <br />
                            Rating : 
                            <asp:Label ID="lblRating" runat="server" Text='<%# Eval("Rating") %>' /><br />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </ItemTemplate>



            <FooterTemplate>
            </FooterTemplate>

        </asp:Repeater>


    </div>
</asp:Content>
