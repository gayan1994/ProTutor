<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProTutor._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="call-to-action text-white text-center">

        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto homeslider">
                    <h1 class="text-white">Learn and develop your skills</h1>
                    <small class="text-white">LEARN | TEACH | SHARPEN</small>
                    <p class="text-white">Learn new skills, pursue your interests, advance your career in a very easy way.</p>
                    <a id="btnRegister" runat="server" href="~/Registration" class="btn btn-primary">Free Register Now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="testimonials text-center bg-light">
        <div class="container">
            <div class="row">

                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="Image/WhatAreWe.jpg" alt="">
                        <h3>What are we?</h3>
                        <p class="font-weight-light mb-0">
                            We are a free online platform that helps you find the best online learning resources. Learn More. Teach Better.  
                        </p>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="Image/8c3ebc224ce7387340d1399b7f22fbf1.jpg" alt="">
                        <h3>Your teaching partner</h3>
                        <p class="font-weight-light mb-0">
                            We have highly qualified carefully selected panel of tutors. You can search subject wise and also tutor wise.
                        </p>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <img class="img-fluid rounded-circle mb-3" src="Image/bestPerformances.jpg" alt="">
                        <h3>Best Performance</h3>
                        <p class="font-weight-light mb-0">The ideal platform for the parents who want their child to have the best chance of getting a top grade and also want the ease and convenience of having fantastic, reputable tutors at hand regardless of location.</p>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>

