<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReceivedLessonRequests.aspx.cs" Inherits="ProTutor.ReceivedLessonRequests" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="py-3 text-center">Recieved Lesson Requests</h1>
        <br />
        <asp:Repeater ID="rptRequests" runat="server">

            <HeaderTemplate>
                <table border="1" class="table">
                    <tr>
                        <th scope="col" style="width: 80px">Student Name
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
                            Text='<%# Eval("StudentName") %>'
                            NavigateUrl='<%#String.Format("~/StudentPublicProfile.aspx?StudentId={0}", Eval("StudentId"))%>'>
                        </asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("Start") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("End") %>' />
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
                            NavigateUrl='<%#String.Format("~/ViewReceivedLessonRequest.aspx?Id={0}", Eval("ID"))%>'></asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>
</asp:Content>


