<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookTree.ascx.cs" Inherits="UserControl_BookTree" %>
<asp:TreeView ID="TreeView1" runat="server" ExpandDepth="0">
    <Nodes>
        <asp:TreeNode SelectAction="None" Text="分类图书" Value="分类图书"></asp:TreeNode>
    </Nodes>
</asp:TreeView>

