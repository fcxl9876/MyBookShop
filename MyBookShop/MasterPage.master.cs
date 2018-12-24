using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Initialize();  //调用自定义方法Initialize()
    }

    /// <summary>
    /// 网站初始化，添加两个角色（Member和Admin）到数据库ASPNETDB中
    /// </summary>
    protected void Initialize()
    {
        if (Roles.GetAllRoles().Length == 0)
        {
            Roles.CreateRole("Member");
            Roles.CreateRole("Admin");
        }
    }

    protected void lbtnReset_Click(object sender, EventArgs e)
    {
        //得到页面上的WebPartManager控件，并重置其个性化属性
        WebPartManager webPartManager = new WebPartManager();
        webPartManager = WebPartManager.GetCurrentWebPartManager(Page);
        webPartManager.Personalization.ResetPersonalizationState();
    }

    protected void imgbtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //如果搜索框不为空，以查询字符串形式传递搜索文本到Search.aspx
        string strQuery = "";
        if (txtSearch.Text.Trim() == "")
        {
            strQuery = "";
        }
        else
        {
            strQuery = "?SearchText=" + txtSearch.Text.Trim();
        }
        Response.Redirect("~/Search.aspx" + strQuery);
    }

    protected void lbtnRegister_Click(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)  //用户已登录
        {
            FormsAuthentication.SignOut();  //注销当前用户
        }
        Response.Redirect("~/NewUser.aspx");
    }

    protected void lbtnLogin_Click(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
        {
            FormsAuthentication.SignOut();  //注销当前用户
        }
        Response.Redirect("~/Login.aspx");
    }
}
