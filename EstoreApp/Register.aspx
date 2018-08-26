<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EstoreApp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Register</h1>
    <div class="form-horizontal col-md-4"> 
       
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox CssClass="form-control" ID="txtemail" runat="server"></asp:TextBox>
        </div>
         <div class="form-group">
            <label>Password</label>
            <asp:TextBox CssClass="form-control" ID="txtpass" runat="server"></asp:TextBox>
        </div>
         <div class="form-group">
            <label>confirm Password</label>
            <asp:TextBox CssClass="form-control" ID="txtconfirm" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-warning"  ID="btnadduser" runat="server" Text="Register" OnClick="btnadduser_Click" />
            <asp:Label ID="lblerror" runat="server"></asp:Label>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtconfirm" CssClass="text-danger"> not identical <span class="glyphicon  glyphicon-exclamation-sign"></span>  </asp:CompareValidator>
        </div>

    </div>



</asp:Content>
