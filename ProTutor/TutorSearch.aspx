<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TutorSearch.aspx.cs" Inherits="ProTutor.TutorSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:TextBox ID="tbxName" type="text" placeholder="Name" runat="server" />
            <asp:TextBox ID="tbxSubject" type="text" placeholder="Subject" runat="server" />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="">None</asp:ListItem>
                <asp:ListItem>Experience</asp:ListItem>
                <asp:ListItem>Degree</asp:ListItem>
                <asp:ListItem>MSC</asp:ListItem>
                <asp:ListItem>Phd</asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox ID="tbxCurriculum" type="text" placeholder="Curriculum" runat="server" />
            <asp:TextBox ID="tbxHourlyRate" type="text" placeholder="Hourly Rate" runat="server" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />


            <asp:Repeater ID="rptTutors" runat="server">
                <HeaderTemplate>
                    <table cellspacing="0" rules="all" border="1">
                        <tr>
                            <th scope="col" style="width: 80px">Tutor Name
                            </th>
                            <th scope="col" style="width: 120px">Subject
                            </th>
                            <th scope="col" style="width: 100px">Qualification
                            </th>
                            <th scope="col" style="width: 100px">Curriculum
                            </th>
                            <th scope="col" style="width: 100px">Hourly rate 
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink1" 
                                runat="server" 
                                Text='<%# Eval("Name") %>'
                                NavigateUrl='<%#String.Format("~/TutorProfile.aspx?TutorId={0}", Eval("ID"))%>'></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("MainSubject") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("HighestQualificaton") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Curriculum") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("HourlyRate") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </form>
</body>
</html>
