<%@ Page Title="注册" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" AutoGeneratePassword="True" ContinueDestinationPageUrl="~/Login.aspx" InvalidPasswordErrorMessage="密码最短长度为 {0}，其中必须包含非字母数字字符。" OnCreatedUser="CreateUserWizard1_CreatedUser">
    <MailDefinition BodyFileName="ThankEmail.txt" From="bookstore2020@126.com" IsBodyHtml="True" Subject="感谢注册">
    </MailDefinition>
    <WizardSteps>
      <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
      </asp:CreateUserWizardStep>
      <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
      </asp:CompleteWizardStep>
    </WizardSteps>
  </asp:CreateUserWizard>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>


