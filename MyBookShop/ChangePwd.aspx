<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" Title="修改用户密码" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:LoginView ID="logvChangePwd" runat="server">
    <AnonymousTemplate>
      <asp:ChangePassword ID="cpwdAnony" runat="server" ContinueDestinationPageUrl="~/Login.aspx" DisplayUserName="True">
        <TextBoxStyle Width="120px" />
      </asp:ChangePassword>
    </AnonymousTemplate>
    <LoggedInTemplate>
      <asp:ChangePassword ID="cpwdLogged" runat="server" ContinueDestinationPageUrl="~/Default.aspx">
        <TextBoxStyle Width="120px" />
      </asp:ChangePassword>
    </LoggedInTemplate>
  </asp:LoginView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>


