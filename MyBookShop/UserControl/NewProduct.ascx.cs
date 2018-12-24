using System;
using System.Linq;

public partial class UserControl_NewProduct : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        var books = (from b in db.Book
                        orderby b.BookId descending
                        select b).Take(7);
        gvProduct.DataSource = books;
        gvProduct.DataBind();
    }
}