<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="EstoreApp.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

<asp:multiview runat="server" ID="MultiView1"  ActiveViewIndex="0">

<asp:View  runat="server">
     <h1> Create Profile</h1>
      <div class="form-horizontal col-md-4"> 
       
        <div class="form-group">
            <label>Full name</label>
            <asp:TextBox CssClass="form-control" ID="txtfullname" runat="server"></asp:TextBox>
        </div>

         <div class="form-group">
            <label>Address</label>
            <asp:TextBox CssClass="form-control" ID="txtaddress"  runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Street</label>
            <asp:TextBox CssClass="form-control" ID="txtstreet"  runat="server"></asp:TextBox>
        </div>
       <div class="form-group">
            <label>File Upload</label>
               <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
        </div>
        <div class="form-group">
            <label>Image</label>
            <asp:Image ID="Image2" Visible="false" runat="server" />
        </div>



        <div class="form-group">
            <asp:Button CssClass="btn btn-primary"  ID="btnCreate" runat="server" Text="Create Profile" OnClick="btnCreate_Click"  />
            <asp:Label ID="lblerror" runat="server"></asp:Label>
  </div>
          
        <div class="form-group">
            <asp:Button CssClass="btn btn-warning"  ID="btnEdit" runat="server" Text="Edit Profile" OnClick="btnEdit_Click"  />
            <asp:Button CssClass="btn btn-danger"  ID="btnDel" runat="server" Text="Delete Profile" OnClick="btnDel_Click" OnClientClick="return confirm('Are You Sure Delete Yourself!!?')"  />
            &nbsp;</div>

    </div>



</asp:View>


<asp:View  runat="server">
    <dl>
    <dt>User ID</dt>
     <dd> <asp:Label ID="lblID" runat="server" Text=""></asp:Label></dd>
  <dt>Full Name </dt>
   <dd> <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></dd>
<dt>Address</dt>
   <dd> <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></dd>
<dt>Street</dt>
   <dd> <asp:Label ID="lblstreet" runat="server" Text=""></asp:Label></dd>

        <dt>Image</dt>
   <dd Class="img-responsive"> <asp:Image ID="Image1" runat="server" Width="120" Height="120" /> </dd>

        <dt>
            <asp:LinkButton ID="lnkEditprofile" runat="server" OnClick="lnkEditprofile_Click">Edit Profile</asp:LinkButton>
        </dt>

</dl>



</asp:View>
<asp:View runat="server"></asp:View>

    </asp:multiview>
</asp:Content>
