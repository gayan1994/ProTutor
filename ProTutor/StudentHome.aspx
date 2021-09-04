<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="ProTutor.StudentHome" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="testimonials text-center bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/PngItem_6275734.png" alt="">
                        <h3>Visit Your Profile</h3>
                        <a runat="server" href="~/StudentProfile" class="btn btn-danger btn-block">Visit Profile</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/pict--advertising-.png" alt="">
                        <h3>Publish Your Advertisements</h3>
                        <a runat="server" href="~/StudentAds" class="btn btn-danger btn-block">Publish Advertisement</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/student.jpg" alt="">
                        <h3>Find Your Tutor</h3>
                        <a runat="server" href="~/TutorSearch" class="btn btn-danger btn-block">Tutor Search</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/sentRequestsPic.jpg" alt="">
                        <h3>View Sent Lesson Requests</h3>
                        <a runat="server" href="~/SentLessonRequests" class="btn btn-danger btn-block">Your Lesson Requests</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0" style="margin-bottom: 10px">
                        <img class="img-fluid rounded-circle mb-3" src="Image/chat.png" alt="">
                        <h3>View Your Conversations</h3>
                        <a runat="server" href="~/StudentConversations" class="btn btn-danger btn-block">Chat</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

