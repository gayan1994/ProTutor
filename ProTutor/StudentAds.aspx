<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentAds.aspx.cs" Inherits="ProTutor.StudentAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1 class="py-3 text-center">Your Advertisements</h1>
        <br />
        <a runat="server" href="~/PublishAds" class="btn btn-success">Add new</a>

        <asp:Repeater ID="rptAds" runat="server">

            <HeaderTemplate>
                <table border="1" class="table" style="margin-top: 10px">
                    <tr>
                        <th scope="col" style="width: 80px">Title
                        </th>
                        <th scope="col" style="width: 120px">Description
                        </th>
                        <th scope="col" style="width: 100px">Created Date
                        </th>
                        <th scope="col" style="width: 100px">Status
                        </th>
                        <th scope="col" style="width: 100px">Actions
                        </th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Eval("CreatedDate", "{0:dd MMMM yyyy hh:mm tt}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("IsActive") %>' />
                    </td>
                    <td>
                        <%--View link to see the lesson request--%>
                        <asp:HyperLink ID="lnkView"
                            runat="server"
                            Text="Edit"
                            CssClass="btn btn-warning btn-block"
                            NavigateUrl='<%#String.Format("~/EditAd.aspx?Id={0}", Eval("ID"))%>'></asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>


</asp:Content>
