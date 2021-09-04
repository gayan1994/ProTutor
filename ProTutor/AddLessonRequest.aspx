<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddLessonRequest.aspx.cs" Inherits="ProTutor.AddLessonRequest" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container testimonials">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h1 class="text-center mb-5">Send Lesson Request</h1>

            <div class="form-group">
                <label for="email">Session start date/time</label>
                <input type="datetime-local" id="inptStart" name="startDate" runat="server" class="form-control" />

                <asp:RequiredFieldValidator ID="ReqStartTime"
                    CssClass="align-left text-danger"
                    ControlToValidate="inptStart"
                    Display="Dynamic"
                    ErrorMessage="Please insert the start time!"
                    runat="server" />

                <span id="startTimeValidation" runat="server" visible="false" class="align-left text-danger">Start time is not valid!</span><br />
            </div>

            <div class="form-group">
                <label for="email">Session End date/time</label>
                <input type="datetime-local" id="inptEnd" name="EndDate" runat="server" class="form-control" />

                <asp:RequiredFieldValidator ID="ReqEndTime"
                    CssClass="align-left text-danger"
                    ControlToValidate="inptEnd"
                    Display="Dynamic"
                    ErrorMessage="Please insert the end time!"
                    runat="server" />

                <span id="endTimeValidation" runat="server" visible="false" class="align-left text-danger">End time is not valid!</span><br />
            </div>

            <div class="form-group">
                <label for="email">Hourly Rate? (Rs)</label>
                <asp:TextBox ID="tbxHourlyRate" type="text" runat="server" class="form-control" />

                <asp:RequiredFieldValidator ID="ReqHourlyRate"
                    CssClass="align-left text-danger"
                    ControlToValidate="tbxHourlyRate"
                    Display="Dynamic"
                    ErrorMessage="Please enter the hourly rate!"
                    runat="server" />

                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                    ControlToValidate="tbxHourlyRate" ErrorMessage="Value must be a number!" CssClass="text-danger" /><br />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Send Lesson Request" OnClick="btnSave_Click" CssClass="btn btn-primary" />
            </div>



        </div>
        <div class="col-md-4"></div>
    </div>

</asp:Content>
