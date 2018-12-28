<%@ Page Title="购物车" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShopCart.aspx.cs" Inherits="ShopCart" %>

<%@ Register Src="UserControl/BookTree.ascx" TagName="BookTree" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <uc:BookTree ID="BookTree1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <asp:Panel ID="pnlCart" runat="server">
    <asp:GridView ID="gvCart" runat="server" Width="100%" AutoGenerateColumns="false">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
            <asp:CheckBox ID="chkBook" runat="server" />
          </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="BookId" HeaderText="商品ID" />
        <asp:BoundField DataField="Name" HeaderText="商品名称" />
        <asp:BoundField DataField="ListPrice" HeaderText="商品价格" DataFormatString="{0:c}" />
        <asp:TemplateField HeaderText="购买数量">
          <ItemTemplate>
            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="30"></asp:TextBox>
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label><br />
    <asp:Label ID="lblHint" runat="server" ForeColor="Green"></asp:Label><br />
    总价：<asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
    &nbsp;&nbsp;
    <asp:Button ID="btnDelete" runat="server" Text="删除商品" OnClick="btnDelete_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="btnClear_Click" />
    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnComputeAgain" runat="server" Text="重新计算" OnClick="btnComputeAgain_Click" />
    &nbsp;
    <asp:Button ID="btnSettle" runat="server" Text="结算" OnClick="btnSettle_Click" />
  </asp:Panel>
  <asp:Label ID="lblCart" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
