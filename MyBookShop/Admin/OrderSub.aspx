<%@ Page Title="订单详细" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderSub.aspx.cs" Inherits="Admin_OrderSub" %>

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
  订单主表
  <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="false"
    Width="100%">
    <Columns>
      <asp:TemplateField>
        <ItemTemplate>
          <table style="width: 100%; border: 1px solid #ccc;">
            <tr>
              <td style="width: 20%; border: 1px solid #ccc; height: 24px; text-align: right;">订单ID：
              </td>
              <td style="width: 80%;">
                <asp:Label ID="lblOrderId" runat="server" Text='<%# Bind("OrderId") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">客户名称：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">订购时间：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblOrderDate" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">地址1：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblAddr1" runat="server" Text='<%# Bind("Addr") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">城市：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">区域：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">邮编：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">手机：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td style="border: 1px solid #ccc; height: 24px; text-align: right;">审核状态：
              </td>
              <td style="border: 1px solid #ccc; height: 24px;">
                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
              </td>
            </tr>
          </table>
        </ItemTemplate>
      </asp:TemplateField>
    </Columns>
  </asp:GridView>
  购买详细
  <asp:GridView ID="gvOrderItem" runat="server" Width="100%" AllowPaging="True" OnPageIndexChanging="gvOrderItem_PageIndexChanging"
    PagerSettings-Mode="NextPrevious" CellPadding="4" ForeColor="#333333"
    GridLines="None" AutoGenerateColumns="False">
    <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" Position="TopAndBottom" PreviousPageText="上一页" />
    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
    <RowStyle BackColor="#E3EAEB" />
    <Columns>
      <asp:TemplateField>
        <ItemTemplate>
          <asp:Image ID="imgArrow" runat="server" ImageUrl="~/Images/arrow.gif" />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="ItemId" HeaderText="序列号" />
      <asp:BoundField DataField="OrderId" HeaderText="订单号" />
      <asp:BoundField DataField="BookName" HeaderText="图书名称" />
      <asp:BoundField DataField="ListPrice" HeaderText="图书单价" />
      <asp:BoundField DataField="Qty" HeaderText="购买数量" />
      <asp:BoundField DataField="TotalPrice" HeaderText="总价" />
    </Columns>
    <PagerStyle BackColor="#ffffff" HorizontalAlign="Left" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#ccccd4" Font-Bold="True" ForeColor="Black" />
    <EditRowStyle BackColor="#7C6F57" />
    <AlternatingRowStyle BackColor="White" />
  </asp:GridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>


