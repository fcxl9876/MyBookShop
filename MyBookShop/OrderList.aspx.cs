using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果匿名访问，转到登录页面
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
        }
        Bind();  //调用自定义方法Bind()
    }
    /// <summary>
    /// 显示登录的用户名对应的订单列表
    /// </summary>
    protected void Bind()
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        var orderItems = from o in db.OrderItem
                         where o.Order.UserName == User.Identity.Name
                         select o;
        gvOrderItem.DataSource = orderItems;
        gvOrderItem.DataBind();
    }

    protected void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvOrderItem.PageIndex = e.NewPageIndex;
        Bind();
    }
}