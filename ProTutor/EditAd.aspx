<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAd.aspx.cs" Inherits="ProTutor.EditAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-center testimonials">
        <h1 class="text-center">Edit Advertisement</h1>

        <div class="row">

            <div class="col-md-4"></div>

            <div class="col-md-4">
                <br />
                <div class="form-group">
                    <asp:TextBox ID="AdTitle" runat="server" placeholder="Title" class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="ReqAdTitle"
                        ControlToValidate="AdTitle"
                        Display="Dynamic"
                        ErrorMessage="Please enter the advertisement title!"
                        runat="server"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <asp:TextBox ID="AdDescription" runat="server" placeholder="Description" class="form-control" TextMode="MultiLine" Style="height: 150px;"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="ReqAdDescription"
                        ControlToValidate="AdDescription"
                        Display="Dynamic"
                        ErrorMessage="Please enter the advertisement description!"
                        runat="server"
                        CssClass="text-danger" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnPublish" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="btnSave_Click" />
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</asp:Content>
