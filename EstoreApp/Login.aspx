<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EstoreApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>LogIn</h1>
        <div class="form-horizontal col-md-4"> 
       
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox CssClass="form-control" ID="txtemail" TextMode="Email" runat="server"></asp:TextBox>
        </div>
         <div class="form-group">
            <label>Password</label>
            <asp:TextBox CssClass="form-control" ID="txtpass" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-warning"  ID="btnlogin" runat="server" Text="Login" OnClick="btnadduser_Click" />
            <asp:Label ID="lblerror" runat="server"></asp:Label>
  </div>

    </div>

</asp:Content>
