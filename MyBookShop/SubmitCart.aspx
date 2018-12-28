<%@ Page Title="提交订单-填写收货地址" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubmitCart.aspx.cs" Inherits="SubmitCart" %>

<%@ Register Src="UserControl/BookTree.ascx" TagName="BookTree" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <uc:BookTree ID="BookTree1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <asp:Panel ID="pnlConsignee" runat="server">
    <table style="width: 100%; border: 2px solid #fff;">
      <tr>
        <td style="text-align: center;" colspan="2">
          <strong>填写发货地址</strong>
        </td>
      </tr>
      <tr>
        <td style="width: 20%; text-align: right;">送货地址：
        </td>
        <td style="width: 80%;">
          <asp:TextBox ID="txtAddr" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvAddr1" runat="server" ErrorMessage="不能为空" ControlToValidate="txtAddr1"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">城市：
        </td>
        <td>
          <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">地区：
        </td>
        <td>
          <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">邮编：
        </td>
        <td>
          <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip" ErrorMessage="不能为空"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="revZip" runat="server" ErrorMessage="邮编错误！" ControlToValidate="txtZip" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">联系电话：
        </td>
        <td>
          <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">&nbsp;
        </td>
        <td>
          <asp:Button ID="btnSubmit" runat="server" Text="提交结算" OnClick="btnSubmit_Click" />
        </td>
      </tr>
    </table>
  </asp:Panel>
  <asp:Label ID="lblMsg" runat="server"></asp:Label>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
