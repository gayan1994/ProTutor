<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorHome.aspx.cs" Inherits="ProTutor.TutorHome" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="testimonials text-center bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/PngItem_6275734.png" alt="">
                        <h3 style="font-size: 23px;">Visit Your Profile</h3>
                        <a runat="server" href="~/TutorProfile" class="btn btn-danger btn-block">Visit Profile</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/pict--advertising-.png" alt="">
                        <h3 style="font-size: 23px;">View Advertisements</h3>
                        <a runat="server" href="~/ViewAds" class="btn btn-danger btn-block">View Advertisements</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/student.jpg" alt="">
                        <h3 style="font-size: 23px;">View Recieved Lesson Requests</h3>
                        <a runat="server" href="~/ReceivedLessonRequests" class="btn btn-danger btn-block">View Lesson Requests</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/chat.png" alt="">
                        <h3>View Your Conversations</h3>
                        <a runat="server" href="~/TutorConversations" class="btn btn-danger btn-block">Chat</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
