<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AutoShow.ascx.cs" Inherits="UserControl_AutoShow" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
      <ProgressTemplate>
        正在连接数据库服务器，请耐心等待......
      </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:Timer ID="tmrAutoShow" runat="server" Interval="3000" OnTick="tmrAutoShow_Tick" Enabled="False">
    </asp:Timer>
    <asp:GridView ID="gvBook" runat="server" AllowPaging="True" AutoGenerateColumns="false" OnPageIndexChanging="gvBook_PageIndexChanging" PagerSettings-Mode="NextPrevious" PageSize="1" Width="100%">
      <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" PreviousPageText="上一页" />
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
            <table style="border: 1px solid #808080; width: 100%;">
              <tr>
                <td style="text-align: center; border: 1px; vertical-align: middle; width: 40%;" rowspan="7">
                  <asp:Image ID="imgImage" runat="server" ImageUrl='<%# Bind("Image") %>' Height="60px" Width="60px" />
                </td>
                <td style="border: 1px solid #808080; width: 40%;">书号： </td>
                <td style="border: 1px solid #808080; width: 20%;">
                  <asp:Label ID="lblBookId" runat="server" Text='<%# Bind("BookId") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">图书名称： </td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">图书价格： </td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblListPrice" runat="server" Text='<%# Bind("ListPrice") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">库存： </td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                </td>
              </tr>
            </table>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:HyperLinkField DataNavigateUrlFields="BookId" DataNavigateUrlFormatString="~/ShopCart.aspx?BookId={0}" DataTextFormatString="{0:c}" HeaderText="放入购物车" Text="购买" />
      </Columns>
    </asp:GridView>
    <asp:CheckBox ID="chkAutoShow" runat="server" AutoPostBack="True" Text="3秒后显示下一个商品" OnCheckedChanged="chkAutoShow_CheckedChanged" />
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="tmrAutoShow" EventName="Tick" />
  </Triggers>
</asp:UpdatePanel>