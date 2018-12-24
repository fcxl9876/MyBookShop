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

