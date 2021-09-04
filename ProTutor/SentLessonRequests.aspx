<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SentLessonRequests.aspx.cs" Inherits="ProTutor.SentLessonRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1 class="py-3 text-center">Sent Lesson Requests</h1>
        <br />
        <asp:Repeater ID="rptRequests" runat="server">

            <HeaderTemplate>
                <table border="1" class="table">
                    <tr>
                        <th scope="col" style="width: 80px">Tutor Name
                        </th>
                        <th scope="col" style="width: 120px">Start Date/Time
                        </th>
                        <th scope="col" style="width: 100px">End Date/Time
                        </th>
                        <th scope="col" style="width: 100px">Status
                        </th>
                        <th scope="col" style="width: 100px">Hourly rate 
                        </th>
                        <th scope="col" style="width: 100px"></th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1"
                            runat="server"
                            Text='<%# Eval("TutorName") %>'
                            NavigateUrl='<%#String.Format("~/TutorPublicProfile.aspx?TutorId={0}", Eval("TutorId"))%>'>
                        </asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("Start", "{0:dd MMMM yyyy hh:mm tt}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("End", "{0:dd MMMM yyyy hh:mm tt}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblHourlyRate" runat="server" Text='<%# Eval("HourlyRate") %>' />
                    </td>
                    <td>
                        <%--View link to see the lesson request--%>
                        <asp:HyperLink ID="lnkView"
                            runat="server"
                            Text="View"
                            CssClass="btn btn-warning btn-block"
                            NavigateUrl='<%#String.Format("~/ViewSentLessonRequest.aspx?Id={0}", Eval("ID"))%>'></asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>


</asp:Content>
