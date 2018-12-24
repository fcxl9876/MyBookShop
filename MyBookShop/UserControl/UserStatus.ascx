<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserStatus.ascx.cs" Inherits="UserControl_UserStatus" %>
<asp:LoginView ID="logvUserStatus" runat="server">
  <AnonymousTemplate>
    您还未登录！
  </AnonymousTemplate>
  <RoleGroups>
    <asp:RoleGroup Roles="Admin">
      <ContentTemplate>
        <asp:LoginName ID="lognAdmin" runat="server" FormatString="您好, {0} " />
        <asp:LinkButton ID="lnkbtnPwd" runat="server" ForeColor="White" PostBackUrl="~/ChangePwd.aspx" CausesValidation="False">密码修改</asp:LinkButton>
        <asp:LinkButton ID="lnkbtnManage" runat="server" ForeColor="White" PostBackUrl="~/Admin/Default.aspx" CausesValidation="False">系统管理</asp:LinkButton>
        <asp:LoginStatus ID="logsAdmin" runat="server" ForeColor="White" LogoutText="退出登录" />
      </ContentTemplate>
    </asp:RoleGroup>
    <asp:RoleGroup Roles="Member">
      <ContentTemplate>
        <asp:LoginName ID="lognMember" runat="server" FormatString="您好, {0} " />
        <asp:LinkButton ID="lnkbtnPwd" runat="server" ForeColor="White" PostBackUrl="~/ChangePwd.aspx" CausesValidation="False">密码修改</asp:LinkButton>
        <asp:LinkButton ID="lnkbtnCart" runat="server" ForeColor="White" PostBackUrl="~/OrderList.aspx" CausesValidation="False">购物记录</asp:LinkButton>
        <asp:LoginStatus ID="logsMember" runat="server" ForeColor="White" LogoutText="退出登录" />
      </ContentTemplate>
    </asp:RoleGroup>
  </RoleGroups>
</asp:LoginView>
