<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorSearch.aspx.cs" Inherits="ProTutor.TutorSearch" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="testimonials text-center">Tutor Search</h1>
        <div class="container">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxName" type="text" placeholder="Name" runat="server" class="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxSubject" type="text" placeholder="Subject" runat="server" class="form-control" />
                    </div>
                    <h5>Highest Qualification</h5>
                    <div class="checkbox">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Value="">None</asp:ListItem>
                            <asp:ListItem Value="Experience">Experience</asp:ListItem>
                            <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                            <asp:ListItem Value="Degree">Degree</asp:ListItem>
                            <asp:ListItem Value="MSC">MSC</asp:ListItem>
                            <asp:ListItem Value="Phd">Phd</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxCurriculum" type="text" placeholder="Curriculum" runat="server" class="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxLocation" type="text" placeholder="Town" runat="server" class="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbxHourlyRate" type="text" placeholder="Maximum hourly rate" runat="server" class="form-control" />

                        <asp:CompareValidator runat="server" Display="Dynamic" Operator="DataTypeCheck" Type="Double"
                            ControlToValidate="tbxHourlyRate" ErrorMessage="Hourly rate must be a number!"
                            CssClass="text-danger" />

                    </div>

                    <h5>Sort by:</h5>
                    <div class="checkbox">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                            <asp:ListItem Value="">None</asp:ListItem>
                            <asp:ListItem Value="Hourly Rate">Hourly Rate</asp:ListItem>
                            <asp:ListItem Value="Name">Name</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-warning btn-block" />
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:Repeater ID="rptTutors" runat="server">
            <HeaderTemplate>
                <div class="alert alert-success">
                    <strong>Search Results!</strong>
                </div>
                <table border="1" style="width: 100%;" class="table">
                    <tr>
                        <th scope="col" style="width: 80px">Tutor Name
                        </th>
                        <th scope="col" style="width: 120px">Subject
                        </th>
                        <th scope="col" style="width: 100px">Qualification
                        </th>
                        <th scope="col" style="width: 100px">Hourly rate (Rs)
                        </th>
                        <th scope="col" style="width: 100px">Town
                        </th>
                        <th scope="col" style="width: 100px">Curriculum
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1"
                            runat="server"
                            Text='<%# Eval("Name") %>'
                            NavigateUrl='<%#String.Format("~/TutorPublicProfile.aspx?TutorId={0}", Eval("ID"))%>'></asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("MainSubject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("HighestQualification") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblHourlyRate" runat="server" Text='<%# Eval("HourlyRate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblHometown" runat="server" Text='<%# Eval("Hometown") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurriculum" runat="server" Text='<%# Eval("Curriculum") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

