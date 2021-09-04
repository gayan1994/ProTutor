<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ProTutor.Registration" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container pt-4 testimonials">
        <div class="col-md-6 text-center">
            <img class="regimg mb-3" src="Image/student.png" alt="">
            <h1>
                <p>Are you a student?</p>
            </h1>
            <p>Click here for free registration</p>
            <br />
            <a class="btn btn-primary" href="~/studentReg" runat="server">Create as student</a>
        </div>

        <div class="col-md-6 text-center">
            <img class="regimg mb-3" src="Image/tutor.png" alt="">
            <h1>
                <p>Are you a tutor?</p>
            </h1>
            <p>Click here for free registration</p>
            <br />
            <a runat="server" href="~/tutorReg" class="btn btn-primary">Create as tutor</a>
        </div>
    </div>
</asp:Content>
