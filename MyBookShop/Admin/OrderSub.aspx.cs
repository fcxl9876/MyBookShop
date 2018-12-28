using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin_OrderSub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
            //跳转到Admin文件夹下的Default.aspx
            Response.Redirect("Default.aspx");
        }
        else
        {
            Bind();  //调用自定义方法Bind()
        }
    }
    /// <summary>
    /// 根据从OrderMaster.aspx传递过来的OrderId值，显示与OrderId值相等的订单记录和订单详细记录
    /// </summary>
    protected void Bind()
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        int orderId = int.Parse(Request.QueryString["OrderId"]);
        var order = from o in db.Order
                    where o.OrderId == orderId
                    select o;
        var orderItem = from i in db.OrderItem
                        where i.OrderId == orderId
                        select i;
        gvOrder.DataSource = order;
        gvOrder.DataBind();
        gvOrderItem.DataSource = orderItem;
        gvOrderItem.DataBind();
    }


    protected void gvOrderItem_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvOrderItem.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }

}