<%@ Page Title="MyBookShop-首页" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControl/NewProduct.ascx" TagName="NewProduct" TagPrefix="uc" %>
<%@ Register Src="UserControl/Category.ascx" TagName="Category" TagPrefix="uc" %>
<%@ Register Src="UserControl/AutoShow.ascx" TagName="AutoShow" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upNewProduct" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
      <asp:WebPartZone ID="zwpNewProduct" runat="server" Width="227" HeaderText="最新商品" WebPartVerbRenderMode="TitleBar">
        <ZoneTemplate>
          <uc:NewProduct ID="NewProduct1" runat="server" title="最新商品" />
        </ZoneTemplate>
      </asp:WebPartZone>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:WebPartZone ID="zwpAutoShow" runat="server" Width="100%" HeaderText="热销商品" WebPartVerbRenderMode="TitleBar">
    <ZoneTemplate>
      <uc:AutoShow ID="AutoShow1" runat="server" title="热销商品" />
    </ZoneTemplate>
  </asp:WebPartZone>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <asp:UpdatePanel ID="upCategory" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
      <asp:WebPartZone ID="zwpCategory" runat="server" Width="227px" HeaderText="商品分类" WebPartVerbRenderMode="TitleBar">
        <ZoneTemplate>
          <uc:Category runat="server" ID="Category" title="商品分类" />
        </ZoneTemplate>
      </asp:WebPartZone>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:GridView ID="gvBook" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="ldsBook" PageSize="5" OnRowDataBound="gvBook_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="图书名称" SortExpression="Name" />
            <asp:BoundField DataField="BookId" HeaderText="图书编号" ReadOnly="True" SortExpression="BookId" />
            <asp:BoundField DataField="Author" HeaderText="图书作者" SortExpression="Author" />
            <asp:BoundField DataField="CategoryId" HeaderText="图书分类号" SortExpression="CategoryId" />
            <asp:BoundField DataField="PressId" HeaderText="出版社号" SortExpression="PressId" />
            <asp:BoundField DataField="Qty" HeaderText="图书库存量" SortExpression="Qty" />
            <asp:BoundField DataField="ListPrice" HeaderText="图书价格" SortExpression="ListPrice" />
            <asp:BoundField DataField="Descn" HeaderText="图书描述" SortExpression="Descn" />
            <asp:ImageField DataImageUrlField="Image" HeaderText="图书图片" SortExpression="Descn" >
                <ControlStyle Height="25px" Width="35px" />
            </asp:ImageField>
            
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ldsBook" runat="server" ContextTypeName="MyBookShopDataContext" EntityTypeName="" TableName="Book"></asp:LinqDataSource>
    每页显示
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
    </asp:DropDownList>
    本图书&nbsp;&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label>
</asp:Content>


