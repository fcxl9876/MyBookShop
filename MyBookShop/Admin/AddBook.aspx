<%@ Page Title="添加商品" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="Admin_AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <a href="CategoryMaster.aspx">分类管理</a>
  <br />
  <br />
  <a href="PressMaster.aspx">出版社管理</a>
  <br />
  <br />
  <a href="BookMaster.aspx">图书管理</a>
  <br />
  <br />
  <a href="OrderMaster.aspx">订单管理</a>
  <br />
  <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <asp:Panel ID="pnlProductMaster" runat="server">
    <table style="width:100%; border:4px solid #fff;">
      <tr>
        <td style="text-align:center; " colspan="2">
          <strong>添加图书</strong>
        </td>
      </tr>
      <tr>
        <td style="width:17%; text-align:right; ">图书名称:
        </td>
        <td style="width:83%; ">
          <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
          <asp:Label ID="lblNameErr" runat="server"
            ForeColor="Red"></asp:Label>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">图书分类:
        </td>
        <td>
          <asp:DropDownList ID="ddlCategoryId" runat="server">
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfvCategoryId" runat="server" ControlToValidate="ddlCategoryId"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">图书单价:
        </td>
        <td>
          <asp:TextBox ID="txtListPrice" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">图书作者：
        </td>
        <td>
          <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">出版社:
        </td>
        <td>
          <asp:DropDownList ID="ddlPressId" runat="server">
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfvPressId" runat="server" ControlToValidate="ddlPressId"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">描述:
        </td>
        <td>
          <asp:TextBox ID="txtDescn" runat="server" Height="89px" TextMode="MultiLine"
            Width="263px"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">库存:
        </td>
        <td>
          <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">图书图片:
        </td>
        <td>
          <asp:FileUpload ID="fupImage" runat="server" />
          <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fupImage"
            ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td style="text-align:right; ">&nbsp;
        </td>
        <td>
          <asp:Button ID="btnAdd" runat="server" Text="添加图书" OnClick="btnAdd_Click" />
        </td>
      </tr>
    </table>
  </asp:Panel>
  <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
