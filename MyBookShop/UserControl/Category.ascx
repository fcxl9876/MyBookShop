<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="Category" %>
<asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
  <AlternatingRowStyle BackColor="White" />
  <Columns>
    <asp:TemplateField>
      <ItemTemplate>
        <asp:Image ID="imgArrow" runat="server" ImageUrl="~/Images/arrow.gif" />
      </ItemTemplate>
    </asp:TemplateField>
    <asp:HyperLinkField DataTextField="Name" DataTextFormatString="{0:c}" DataNavigateUrlFields="CategoryId" DataNavigateUrlFormatString="~/BookShow.aspx?CategoryId={0}" HeaderText="分类名称" />
    <asp:BoundField DataField="BookCount" DataFormatString="({0})" HeaderText="图书数量" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
  </Columns>
  <EditRowStyle BackColor="#7C6F57" />
  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
  <HeaderStyle BackColor="#ccccd4" Font-Bold="True" ForeColor="Black" />
  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
  <RowStyle BackColor="#E3EAEB" />
  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
</asp:GridView>
