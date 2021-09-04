<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAds.aspx.cs" Inherits="ProTutor.ViewAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1 class="py-3 text-center">View Advertisements</h1>
        <br />
        <asp:Repeater ID="rptAds" runat="server">

            <HeaderTemplate>
                <table border="1" class="table">
                    <tr>
                        <th scope="col" style="width: 80px">Student Name
                        </th>
                        <th scope="col" style="width: 80px">Title
                        </th>
                        <th scope="col" style="width: 120px">Description
                        </th>
                        <th scope="col" style="width: 100px">Created Date
                        </th>
                        <th scope="col" style="width: 100px">Status
                        </th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1"
                            runat="server"
                            Text='<%# Eval("Name") %>'
                            NavigateUrl='<%#String.Format("~/StudentPublicProfile.aspx?StudentId={0}", Eval("ID"))%>'>
                        </asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("CreatedDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("IsActive") %>' />
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>



</asp:Content>
