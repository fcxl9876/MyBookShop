using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Admin_PressMaster : System.Web.UI.Page
{
    protected void DetailsView1_ItemDeleting(Object sender, DetailsViewDeleteEventArgs e)
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        var productCount = (from b in db.Book
                            where b.PressId == int.Parse(DetailsView1.DataKey.Value.ToString())
                            select b).Count();
        if (productCount != 0)
        {
            lblError.Text = "Error：该分类下有商品，请先删除商品！";
            e.Cancel = true;
        }
    }
}