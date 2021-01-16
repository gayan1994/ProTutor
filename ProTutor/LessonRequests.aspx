<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LessonRequests.aspx.cs" Inherits="ProTutor.LessonRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     
    <asp:Repeater ID="rptRequests" runat="server">
                <HeaderTemplate>
                    <table cellspacing="0" rules="all" border="1">
                        <tr>
                            <th scope="col" style="width: 80px"> Student Name
                            </th>
                            <th scope="col" style="width: 120px">Start Date/Time
                            </th>
                            <th scope="col" style="width: 100px">End Date/Time
                            </th>
                            <th scope="col" style="width: 100px">Status
                            </th>
                            <th scope="col" style="width: 100px">Hourly rate 
                            </th>
                            <th scope="col" style="width: 100px"> 
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                           <asp:Label ID="lblName" runat="server" Text='<%# Eval("StudentName") %>' />
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
                            <asp:HyperLink ID="lnkView" 
                                runat="server" 
                                Text="View"
                                NavigateUrl='<%#String.Format("~/ViewLessonRequest.aspx?Id={0}", Eval("ID"))%>'></asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

</body>
</html>
