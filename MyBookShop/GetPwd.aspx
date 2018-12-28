<%@ Page Title="找回用户密码" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetPwd.aspx.cs" Inherits="GetPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
    <MailDefinition From="bookstore2020@126.com" IsBodyHtml="true" Subject="您的新密码"
      BodyFileName="GetPwd.txt">
    </MailDefinition>
  </asp:PasswordRecovery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>


