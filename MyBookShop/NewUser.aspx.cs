using System;
using System.Web.Security;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //将注册的用户添加到"Member"角色
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Member");
    }
}