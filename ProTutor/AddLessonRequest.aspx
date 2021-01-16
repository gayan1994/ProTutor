<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLessonRequest.aspx.cs" Inherits="ProTutor.AddLessonRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <label>Session start date/time</label>
        <input type="datetime-local" id="inptStart" name="startDate" runat="server"/><br />
        <span id="startTimeValidation" runat="server" visible="false" class="align-left">Start time is not valid</span><br /><br />

        <label>Session End date/time</label>
        <input type="datetime-local" id="inptEnd" name="EndDate" runat="server"/><br />
        <span id="endTimeValidation" runat="server" visible="false" class="align-left">End time is not valid</span><br /><br />

        <label>Hourly Rate</label>
        <asp:TextBox ID="tbxHourlyRate" type="text" runat="server"/>
        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double" 
                    ControlToValidate="tbxHourlyRate" ErrorMessage="Value must be a number" /><br /><br />

        <asp:Button ID="btnSave" runat="server" Text="Send Lesson Request" OnClick="btnSave_Click" />

    </form>
</body>
</html>
