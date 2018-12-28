using System;
using System.Linq;

public partial class SubmitCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
        }
        pnlConsignee.Visible = true;
        lblMsg.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        //在Order表中添加记录
        Order order = new Order();
        order.UserName = User.Identity.Name;
        order.OrderDate = DateTime.Now;
        order.Addr = txtAddr.Text.Trim();
        order.City = txtCity.Text.Trim();
        order.State = txtState.Text.Trim();
        order.Zip = txtZip.Text.Trim();
        order.Phone = txtPhone.Text.Trim();
        order.Status = "未审核";
        db.Order.InsertOnSubmit(order);
        db.SubmitChanges();

        //在OrderItem中添加记录
        int orderId = order.OrderId;
        for (int i = 0; i < Profile.Cart.Name.Count; i++)
        {
            OrderItem orderItem = new OrderItem();
            orderItem.OrderId = orderId;
            orderItem.BookName = (string)Profile.Cart.Name[i];
            orderItem.ListPrice = (decimal)Profile.Cart.ListPrice[i];
            orderItem.Qty = (int)Profile.Cart.Qty[i];
            orderItem.TotalPrice = (int)Profile.Cart.Qty[i] * (decimal)Profile.Cart.ListPrice[i];

            //修改Product表的商品库存
            var product = (from p in db.Book
                           where p.BookId == Profile.Cart.BookId[i].ToString()
                           select p).First();
            product.Qty -= orderItem.Qty;

            db.OrderItem.InsertOnSubmit(orderItem);
            db.SubmitChanges();
        }

        //清空各数组列表对象
        Profile.Cart.Qty.Clear();
        Profile.Cart.Name.Clear();
        Profile.Cart.BookId.Clear();
        Profile.Cart.ListPrice.Clear();
        Profile.Cart.TotalPrice = "";
        pnlConsignee.Visible = false;
        lblMsg.Text = "已经成功结算，谢谢光临！";
    }
}