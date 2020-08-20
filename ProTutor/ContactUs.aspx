<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ProTutor.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .leftSide {
            width: 260px;
            display:inline-block;
            margin-left:10px;
            
        }

        .rightSide{

            width: 260px;
            display:inline-block;
            margin-left:100px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        </form>


    <div class="leftSide">

        <div class="contentLeft">



        Contact us here <br /><br />
        
        <asp:TextBox ID="yourName" runat="server" placeholder="Your Name"></asp:TextBox> <br /> <br />

        <asp:TextBox ID="yourEmail" runat="server" placeholder="Your Email"></asp:TextBox> <br /> <br />

        <asp:TextBox ID="message" runat="server" placeholder="Message"></asp:TextBox> <br /> <br />



        </div>


        <asp:Button ID="sendMessage" runat="server" Text="SEND MESSAGE" />


    </div>


    <div class="rightSide">

        <div class="contentRight">

        <div class="Telephone"> 

            <p>Telephone (weekdays 9:00am- 5:00pm)</p>
            <p>0332233447 - General Enquiries </p>

        </div>
            <br/>

        <div class="PostalAddress"> 

            <p>Our Postal Address</p>
            <p>20/05/01/E</p>
            <p>Ambagahalanda Watta Rd </p>
            <p>Yakkala </p>

        </div>

            <br />

        <div class="Email"> 

            <p>Email</p>
            <p>General Enquiries : support@protutor.com</p>

        </div>

            </div>
    </div>
   

    
</body>
</html>
